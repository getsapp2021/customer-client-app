import 'dart:async';
import 'package:customer/src/core/errors/failure.dart';
import 'package:customer/src/core/models/phone_number.dart';
import 'package:customer/src/core/models/user_profile.dart';
import 'package:customer/src/core/services/user_profile_service.dart';
import 'package:customer/src/core/utils/enums/auth_status.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:customer/src/app/locator.dart';
import 'package:customer/src/app/gets_extensions.dart';
import 'package:customer/src/core/services/base/authentication_service.dart';
import 'package:customer/src/app/helper.dart';
import 'package:logger/logger.dart';

class AuthenticationService implements AuthenticationServiceBase {
  @override
  Logger logger = getLogger("AuthenticationService");

  final FirebaseAuth _firebaseAuth = locator<FirebaseAuth>();
  final UserProfileService _userProfileService = locator<UserProfileService>();

  PhoneAuthCredential _phoneAuthCredential;
  String _verificationId;
  int _forceResendingToken;
  PhoneNumber _phoneNumber;

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
  Future<void> sendOtp(
    PhoneNumber phoneNumber, {
    void Function() onAutomaticVerificationCompleted,
    void Function() onCodeSent,
    void Function(Failure failure) onVerificationFailed,
    void Function() onCodeAutoRetrievalTimeout,
    bool isResending = false,
  }) async {
    _phoneNumber = phoneNumber;
    if (!isResending) _forceResendingToken = null;

    void verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
      logger.i("[sendOtp]: verificationCompleted");

      this._phoneAuthCredential = phoneAuthCredential;
      await signIn();

      if (onAutomaticVerificationCompleted != null)
        onAutomaticVerificationCompleted();
    }

    void verificationFailed(FirebaseAuthException error) {
      logger.e("[sendOtp]: verificationFailed", error, error.stackTrace);

      if (onVerificationFailed != null)
        onVerificationFailed(Failure(message: error.getErrorMessageToDisplay));
    }

    void codeSent(String verificationId, [int forceResendingToken]) {
      logger.i("[sendOtp]: codeSent");

      this._verificationId = verificationId;
      this._forceResendingToken = forceResendingToken;

      if (onCodeSent != null) onCodeSent();
    }

    void codeAutoRetrievalTimeout(String verificationId) {
      logger.i("[sendOtp]: codeAutoRetrievalTimeout");
      _verificationId = verificationId;

      if (onCodeAutoRetrievalTimeout != null) onCodeAutoRetrievalTimeout();
    }

    try {
      if (_forceResendingToken == null)
        logger.i(
            "[sendOtp]: Sending verification code to ${phoneNumber.completeNumber}");
      else
        logger.i(
            "[sendOtp]: Resending verification code to ${phoneNumber.completeNumber}");
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber.completeNumber,
        timeout: Duration(seconds: 120),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        forceResendingToken: _forceResendingToken,
      );
    } on FirebaseAuthException catch (e, s) {
      logger.e("[sendOtp]: A firebase auth exception has occurred.", e, s);
      throw Failure(message: e.getErrorMessageToDisplay);
    }
  }

  @override
  Future<void> verifyOtp(String smsOtp) async {
    logger.i(
        "[verifyOtp]: Manually Verifying Phone number: ${_phoneNumber.completeNumber}, $_verificationId, $smsOtp");
    try {
      this._phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: this._verificationId,
        smsCode: smsOtp,
      );

      await signIn();
    } on Failure {
      rethrow;
    } catch (e, s) {
      logger.e("[verifyOtp]: A general exception caught.", e, s);
      throw Failure(
          message: "Something went wrong, Please try again or report us!");
    }
  }

  @override
  Future<void> signIn() async {
    try {
      await _signInPhoneAuthCredential();

      if (await _isFirstTimeUser()) {
        await _registerCurrentUser();
      }
    } on FirebaseAuthException catch (e, s) {
      logger.e("[_login]: A firebase auth exception has occurred.", e, s);
      throw Failure(message: e.getErrorMessageToDisplay);
    } on Failure {
      rethrow;
    }
  }

  @override
  Future<void> signUp(UserProfile userProfile) {
    return _userProfileService.createUserProfile(userProfile);
  }

  Future<bool> _isFirstTimeUser() async {
    return isUserLoggedIn && (await currentUserProfile) == null;
  }

  Future<void> _signInPhoneAuthCredential() async {
    try {
      await _firebaseAuth.signInWithCredential(this._phoneAuthCredential);

      // Reset Session
      _verificationId = null;
      _forceResendingToken = null;
      _phoneNumber = null;
      _phoneAuthCredential = null;
    } on FirebaseAuthException catch (e, s) {
      logger.e("[_login]: A firebase auth exception has occurred.", e, s);
      throw Failure(message: e.getErrorMessageToDisplay);
    } on Failure {
      rethrow;
    }
  }

  Future<void> _registerCurrentUser() {
    User user = _firebaseAuth.currentUser;

    if (user == null) throw Failure(message: "User is not logged in.");

    if (user.phoneNumber != _phoneNumber?.completeNumber)
      throw Failure(message: "Authorization Failed.");

    UserProfile userProfile = UserProfile(
      phoneNumber: _phoneNumber,
      uid: user.uid,
    );

    return signUp(userProfile);
  }
}
