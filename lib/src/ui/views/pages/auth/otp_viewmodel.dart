import 'package:customer/src/app/locator.dart';
import 'package:customer/src/core/models/phone_number.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:customer/src/core/services/authentication_service.dart';
import 'package:customer/src/app/router.gr.dart';
import 'package:customer/src/app/gets_extensions.dart';

class OtpViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();

  bool _enableResendOtpButton;
  bool get enableResendOtpButton => _enableResendOtpButton;

  int _secondsToWait;
  int get secondsToWait => _secondsToWait;

  String _smsOtp;
  set smsOtp(String value) => _smsOtp = value;

  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  final TextEditingController otpTextEditingController = TextEditingController();

  PhoneNumber phoneNumber;

  void initialise(PhoneNumber phoneNumber){
    _enableResendOtpButton = false;
    _secondsToWait = 60;
    this.phoneNumber = phoneNumber;
  }

  void _resetTimer() {
    _secondsToWait += 30;
    _enableResendOtpButton = false;
    notifyListeners();
  }

  void timeExpired() {
    _enableResendOtpButton = true;
    notifyListeners();
  }


  void performVerifyOtp() => performTryOrFailure(() async {
        if (!otpFormKey.currentState.validate()) return;

        otpFormKey.currentState.save();
        setBusy(true);
        bool isFirstTimeUser = await _authenticationService.verifyOtp(_smsOtp);

        if (isFirstTimeUser) {
          await _authenticationService.registerCurrentUser(phoneNumber);
          setBusy(false);
          return _navigationService.replaceWith(Routes.editProfilePage);
        }
        setBusy(false);
        _navigationService.navigateToStartupPage();
      });

  void resendOtp(PhoneNumber phoneNumber) {
    print("Resending the OTP...");
    otpTextEditingController.clear();
    _authenticationService.sendOtp(phoneNumber.completeNumber);
    _resetTimer();
  }
}
