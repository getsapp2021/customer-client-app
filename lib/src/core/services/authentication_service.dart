import 'package:customer/src/core/errors/failure.dart';
import 'package:customer/src/core/models/phone_number.dart';
import 'package:customer/src/core/models/user_profile.dart';
import 'package:customer/src/core/services/user_profile_service.dart';
import 'package:customer/src/core/utils/enums/auth_status.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:customer/src/app/locator.dart';
import 'package:customer/src/core/utils/extensions/firebase_auth_exception_extension.dart';

abstract class AuthenticationServiceBase {
  bool get isUserLoggedIn;
  Future<UserProfile> get currentUserProfile;
  Stream<AuthStatus> get onAuthStatusChanged;

  Future<void> sendOtp(String completePhoneNumber);
  Future<void> verifyOtp(String smsOtp);

  signOut();
}

class AuthenticationService extends AuthenticationServiceBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final UserProfileService _userProfileService = locator<UserProfileService>();

  PhoneAuthCredential _phoneAuthCredential;
  String _verificationId;
  int _forceResendingToken;

  bool get isUserLoggedIn => _firebaseAuth.currentUser != null;

  Future<UserProfile> get currentUserProfile async {
    if (!isUserLoggedIn) return null;
    return await _userProfileService
        .getUserProfile(_firebaseAuth.currentUser.uid);
  }

  Stream<AuthStatus> get onAuthStatusChanged {
    return _firebaseAuth.authStateChanges().map<AuthStatus>(
        (user) => user != null ? AuthStatus.loggedIn : AuthStatus.loggedOut);
  }

  Future<void> signOut() => _firebaseAuth.signOut();

  @override
  Future<void> sendOtp(String completePhoneNumber) async {
    if (_forceResendingToken == null) {
      print("Intialized Phone Authentication for $completePhoneNumber");
    } else {
      print("Resending OTP for $completePhoneNumber");
    }
    void verificationCompleted(PhoneAuthCredential phoneAuthCredential) {
      print("Auto verificationCompleted for $completePhoneNumber");

      this._phoneAuthCredential = phoneAuthCredential;
      _login();
    }

    void verificationFailed(FirebaseAuthException error) {
      print("verificationFailed for $completePhoneNumber: $error");
      throw Failure(message: error.getErrorMessageToDisplay);
    }

    void codeSent(String verificationId, [int forceResendingToken]) {
      print("codeSent for $completePhoneNumber");

      this._verificationId = verificationId;
      this._forceResendingToken = forceResendingToken;
    }

    void codeAutoRetrievalTimeout(String verificationId) {
      print('codeAutoRetrievalTimeout for $completePhoneNumber');
    }

    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: completePhoneNumber,
        timeout: Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        forceResendingToken: _forceResendingToken,
      );
    } on FirebaseAuthException catch (e) {
      print("A firebase auth exception has occured: $e");
      throw Failure(message: e.getErrorMessageToDisplay);
    }
  }

  @override
  Future<bool> verifyOtp(String smsOtp) async {
    print("Manually Verifying Phone number: $_verificationId, $smsOtp");
    try{
      this._phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: this._verificationId,
        smsCode: smsOtp,
      );
      await _login();
      return _isFirstTimeUser();

    } on Failure{
      rethrow;
    }
    catch(e){
      throw Failure(message: "Something went wrong, Please try again or report us!");
    }

  }

  Future<bool> _isFirstTimeUser() async {
    return isUserLoggedIn && (await currentUserProfile) == null;
  }

  Future<void> _login() async {
    try {
      await _firebaseAuth.signInWithCredential(this._phoneAuthCredential);

      // Reset Session
      _verificationId = null;
      _forceResendingToken = null;
    } on FirebaseAuthException catch (e) {
      print("A firebase auth exception has occured: $e");
      throw Failure(message: e.getErrorMessageToDisplay);
    }
  }

  Future<void> registerCurrentUser(PhoneNumber phoneNumber) {
    User user = _firebaseAuth.currentUser;
    if (user.phoneNumber != phoneNumber.completeNumber){
      throw Failure(message: "Authorization Failed. Provided phone number does not match with current user's phone number.");
    }
    if (user == null) throw Failure(message: "User is not logged in.");
    UserProfile userProfile = UserProfile(
      phoneNumber: phoneNumber,
      uid: user.uid,
    );
    return _userProfileService.createUserProfile(userProfile);
  }
}
