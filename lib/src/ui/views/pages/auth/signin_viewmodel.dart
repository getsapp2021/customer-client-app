import 'package:customer/src/core/models/phone_number.dart';
import 'package:customer/src/core/services/authentication_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:customer/src/app/router.gr.dart';
import 'package:customer/src/core/utils/extensions/base_viewmodel_extension.dart';

import 'package:customer/src/app/locator.dart';

class SigninViewModel extends BaseViewModel {
  PhoneNumber phoneNumber;

  NavigationService _navigationService = locator<NavigationService>();
  AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  final GlobalKey<FormState> phoneNumberFormKey = GlobalKey<FormState>();

  void performSendOtp() => performTryOrFailure(() async {
        if (!phoneNumberFormKey.currentState.validate()) return;

        phoneNumberFormKey.currentState.save();
        setBusy(true);
        await _authenticationService.sendOtp(phoneNumber.completeNumber);
        setBusy(false);
        _navigationService.navigateTo(
          Routes.otpPage,
          arguments: OtpPageArguments(phoneNumber: phoneNumber),
        );
      });
}
