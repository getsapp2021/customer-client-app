import 'package:customer/src/core/errors/failure.dart';
import 'package:customer/src/core/models/phone_number.dart';
import 'package:customer/src/core/models/user_profile.dart';
import 'package:customer/src/core/services/base_service.dart';
import 'package:customer/src/core/utils/enums/auth_status.dart';

abstract class AuthenticationServiceBase extends BaseService {
  bool get isUserLoggedIn;

  Future<UserProfile> get currentUserProfile;

  Stream<AuthStatus> get onAuthStatusChanged;

  Future<void> signIn();

  Future<void> signUp(UserProfile userProfile);

  Future<void> signOut();

  // Phone Authentication process is highly coupled with Firebase Authentication Services
  Future<void> sendOtp(
    PhoneNumber phoneNumber, {
    void Function() onAutomaticVerificationCompleted,
    void Function() onCodeSent,
    void Function(Failure failure) onVerificationFailed,
    void Function() onCodeAutoRetrievalTimeout,
  });

  Future<void> verifyOtp(String smsOtp);
}
