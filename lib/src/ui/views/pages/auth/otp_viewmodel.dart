import 'package:customer/src/app/locator.dart';
import 'package:customer/src/core/errors/failure.dart';
import 'package:customer/src/core/models/phone_number.dart';
import 'package:customer/src/ui/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:customer/src/core/services/authentication_service.dart';
import 'package:customer/src/app/router.gr.dart';
import 'package:customer/src/app/gets_extensions.dart';

enum SendOTPState { None, Sending, Sent }

class OtpViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService dialogService = locator<DialogService>();

  bool _enableResendOtpButton;

  bool get enableResendOtpButton => _enableResendOtpButton;

  int _secondsToWait;

  int get secondsToWait => _secondsToWait;

  SendOTPState _resendOTPState = SendOTPState.None;

  SendOTPState get resendOTPState => _resendOTPState;

  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  final TextEditingController otpTextEditingController =
      TextEditingController();

  PhoneNumber phoneNumber;

  void initialise(PhoneNumber phoneNumber) {
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

    if (_resendOTPState == SendOTPState.Sent) {
      _resendOTPState = SendOTPState.None;
    }

    notifyListeners();
  }

  void performVerifyOtp() => performTryOrHandleFailure(() async {
        if (!otpFormKey.currentState.validate()) return;

        setBusy(true);
        await _authenticationService.verifyOtp(otpTextEditingController.text);
        setBusy(false);

        _navigationService.replaceWith(Routes.editProfilePage);
      });

  void resendOtp(PhoneNumber phoneNumber) async {
    otpTextEditingController.clear();
    _resendOTPState = SendOTPState.Sending;
    notifyListeners();
    await _authenticationService.sendOtp(
      phoneNumber,
      isResending: true,
      onAutomaticVerificationCompleted: () =>
          _navigationService.replaceWith(Routes.editProfilePage),
      onCodeSent: () {
        _resendOTPState = SendOTPState.Sent;
        _resetTimer();
      },
      onVerificationFailed: (error) => showErrorDialog(error.message),
    );
  }
}
