import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/ui/views/pages/auth/otp_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:customer/src/ui/views/widgets/countdown_timer.dart';
import 'package:stacked/stacked.dart';

class OtpPage extends StatelessWidget {
  final String countryCode;
  final String phoneNumber;

  OtpPage({this.countryCode, this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ViewModelBuilder<OtpViewModel>.reactive(
      viewModelBuilder: () => OtpViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: ThemeColors.pageBackground,
        appBar: AppBar(
          backgroundColor: ThemeColors.primaryLight,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height / 30,
                  horizontal: width / 20,
                ),
                child: Text(
                  "Please enter the otp sent to:",
                  style: TextStyle(
                    fontSize: width * 0.038,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width / 20.0),
                child: Text(
                  "$countryCode $phoneNumber",
                  style: TextStyle(
                    fontSize: width*0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: height / 50, left: width / 20, right: width / 10),
                child: Form(
                  key: model.formKey,
                  child: TextFormField(
                    autofocus: true,
                    cursorColor: ThemeColors.primary,
                    cursorWidth: 3,
                    style: TextStyle(
                      color: ThemeColors.body,
                      fontSize: width*0.12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.justify,
                    maxLength: 6,
                    decoration: InputDecoration(
                      hintText: "000000",
                      counterText: "",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: height/20),
                    ),
                    onSaved: (value) => model.otpText = value,
                  ),
                ),
              ),
              SizedBox(height: height * 0.1),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width / 20.0),
                    child: Text(
                      "Haven’t receive it yet?",
                      style: TextStyle(
                        fontSize: width*0.045,
                      ),
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
                              ? ThemeColors.body
                              : ThemeColors.primary,
                          fontSize: width*0.045),
                    ),
                    onTap:
                        model.enableResendOtpButton ? model.resetTimer : null,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: width / 20.0),
                child: Row(
                  children: [
                    Text(
                      "Request new code in ",
                      style: TextStyle(
                        fontSize: width*0.038,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GCountDownTimer(
                      secondsRemaining: model.secondsToWait,
                      whenTimeExpires: model.timeExpired,
                      countDownTimerStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
