import 'package:customer/src/app/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OtpViewModel extends BaseViewModel {

   String _otpText = "";
   GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   GlobalKey<FormState> get formKey => _formKey;
   set otpText (String value) => _otpText = value;
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
}