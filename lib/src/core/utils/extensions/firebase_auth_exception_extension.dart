import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseAuthExceptionExtension on FirebaseAuthException {
  String get getErrorMessageToDisplay {
    switch (this.code.toLowerCase()) {
      case 'email-already-in-use':
        return 'An account already exists for the email you\'re trying to use. Login instead.';
      case 'invalid-email':
        return 'The email you\'re using is invalid. Please use a valid email.';
      case 'operation-not-allowed':
        return 'The authentication is not enabled on Firebase. Please enable the Authentitcation type on Firebase';
      case 'weak-password':
        return 'Your password is too weak. Please use a stronger password.';
      case 'wrong-password':
        return 'You seemed to have entered the wrong password. Double check it and try again.';
      case 'user_not_found':
        return 'No user found, try sign up instead!';
      case 'network_request_failed':
        return 'Make sure you connected with the internet!';
      case 'requires_recent_login':
        return 'Re-login is required!';
      case 'invalid-verification-code':
        return 'OTP is not valid, please try again!';
      case 'invalid-verification-id':
        return 'Verification ID is not valid, please try again!';
      case 'invalid-phone-number':
        return 'Invalid phone number, please make sure you have entered correct phone number!';
      case 'too-many-requests':
        return this.message;
      // TODO: check later with these messages
      case 'user-disabled':
        return 'User you\'re trying to login with is disabled by admin. contact admin for further process.';
      case 'invalid-credential':
        return 'Credentials are seems to be expired or altered.';
      default:
        return this.message ??
            'Something went wrong on our side. Please try again';
    }
  }
}
