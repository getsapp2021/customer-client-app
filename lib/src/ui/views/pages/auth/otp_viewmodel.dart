import 'package:customer/src/app/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:customer/src/core/services/authentication_service.dart';
import 'package:customer/src/app/router.gr.dart';
import 'package:customer/src/core/utils/extensions/base_viewmodel_extension.dart';

class OtpViewModel extends BaseViewModel {
  String _otpText = "";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;
  set otpText(String value) => _otpText = value;
  bool enableResendOtpButton = false;
  int secondsToWait = 30;

  NavigationService _navigationService = locator<NavigationService>();
  void navigateTo(String routeName) {
    _navigationService.navigateTo(routeName);
  }

  void resetTimer() {
    secondsToWait += 30;
    enableResendOtpButton = false;
    notifyListeners();
  }

  void timeExpired() {
    enableResendOtpButton = true;
    notifyListeners();
  }

  String _smsOtp;

  set smsOtp(String value) => _smsOtp = value;

  AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  GlobalKey<FormState> _otpFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> get otpFormKey => _otpFormKey;

  void performVerifyOtp() => performTryOrFailure(() async {
        if (!_otpFormKey.currentState.validate()) return;

        _otpFormKey.currentState.save();
        setBusy(true);
        bool isFirstTimeUser = await _authenticationService.verifyOtp(_smsOtp);
        setBusy(false);
        if (isFirstTimeUser) {
          await _authenticationService.registerCurrentUser();
          _navigationService.navigateTo(Routes.editProfilePage);
        }
        _navigationService.navigateTo(Routes.homePage);
      });

  void resendOtp() {
    // TODO:
    throw UnimplementedError();
  }
}
