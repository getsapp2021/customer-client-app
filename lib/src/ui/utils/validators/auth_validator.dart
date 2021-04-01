import 'package:customer/src/app/gets_extensions.dart';

class AuthValidator {
  static String phoneValidator(String value) {
    if (value.isEmpty) return "Phone number is required!";
    if (value.length != 10) return "Phone number must be of exact 10 digits!";
    if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value))
      return "Invalid phone number!";
    return null;
  }

  static String otpValidator(String value) {
    if (value.isEmpty) return "OTP is required!";
    if (value.length != 6) return "Invalid OTP!";
    return null;
  }

  static String fullNameValidator(String value) {
    return null;
  }

  static String emailValidator(String value) {
    if (value.isNotEmpty && !value.isEmail) {
      return "Invalid Email Address!";
    }
    return null;
  }
}
