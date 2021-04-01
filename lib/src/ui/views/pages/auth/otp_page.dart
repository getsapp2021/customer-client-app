import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:customer/src/core/models/phone_number.dart';
import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/ui/views/widgets/g_circular_progress_indicator.dart';
import 'package:customer/src/ui/utils/validators/auth_validator.dart';
import 'package:customer/src/ui/views/pages/auth/otp_viewmodel.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_button.dart';
import 'package:customer/src/ui/views/widgets/g_countdown_timer.dart';

class OtpPage extends StatelessWidget {
  final PhoneNumber phoneNumber;

  OtpPage({this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ViewModelBuilder<OtpViewModel>.reactive(
      viewModelBuilder: () => OtpViewModel(),
      onModelReady: (model) => model.initialise(phoneNumber),
      builder: (context, model, child) => Scaffold(
        backgroundColor: ThemeColors.primaryLight,
        appBar: AppBar(
          backgroundColor: ThemeColors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.07,
            vertical: height * 0.09,
          ),
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Please enter the otp sent to:",
                style: TextStyle(
                  fontSize: width * 0.038,
                ),
              ),
              Text(
                "${phoneNumber.countryCode} ${phoneNumber.number}",
                style: TextStyle(
                  fontSize: width * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Form(
                key: model.otpFormKey,
                child: TextFormField(
                  autofocus: true,
                  cursorColor: ThemeColors.primary,
                  cursorWidth: 3,
                  controller: model.otpTextEditingController,
                  style: TextStyle(
                    color: ThemeColors.gray,
                    fontSize: width * 0.12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.justify,
                  maxLength: 6,
                  decoration: InputDecoration(
                    hintText: "000000",
                    counterText: "",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: height / 20),
                  ),
                  onSaved: (value) => model.smsOtp = value,
                  validator: AuthValidator.otpValidator,
                ),
              ),
              SizedBox(height: height * 0.1),
              Row(
                children: [
                  Text(
                    "Haven’t receive it yet?",
                    style: TextStyle(
                      fontSize: width * 0.045,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  // otpResend(),
                  GestureDetector(
                    child: Text(
                      "Resend OTP",
                      style: TextStyle(
                        color: !model.enableResendOtpButton
                            ? ThemeColors.gray
                            : ThemeColors.primary,
                        fontSize: width * 0.045,
                      ),
                    ),
                    onTap:
                        model.enableResendOtpButton ? () => model.resendOtp(phoneNumber) : null,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Request new code in ",
                    style: TextStyle(
                      fontSize: width * 0.038,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),
              SizedBox(height: 40),
              model.isBusy ? GCircularProgressIndicator() : GRoundedButton(
                onPressed: () => model.performVerifyOtp(),
                color: ThemeColors.primary,
                text: "Verify OTP",
              )
            ],
          ),
        ),
      ),
    );
  }
}
