import 'package:customer/src/ui/utils/theme_colors.dart';
import 'package:customer/src/ui/utils/validators/auth_validator.dart';
import 'package:customer/src/ui/views/pages/auth/signin_viewmodel.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'widgets/phone_field.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ViewModelBuilder<SigninViewModel>.reactive(
      viewModelBuilder: () => SigninViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: ThemeColors.pageBackground,
        body: OrientationBuilder(
          builder: (context, orientation) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: height * 0.1),
                  Container(
                    width: width * 0.4,
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/auth/sign_in_logo.png",
                      height: height * 0.2,
                      // alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(height: height * 0.07),
                  Container(
                    padding: EdgeInsets.fromLTRB(width / 20, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Hey There!",
                      style: TextStyle(
                        fontSize: width * 0.060,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(width / 20, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(
                          "Login with your mobile number",
                          style: TextStyle(
                            fontSize: width * 0.045,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.065,
                  ),
                  Form(
                    key: model.phoneNumberFormKey,
                    child: Container(
                      height: height * 0.065,
                      padding: EdgeInsets.fromLTRB(width / 20, 0, 10, 0),
                      child: IntlPhoneField(
                        validator: AuthValidator.phoneValidator,
                        showDropdownIcon: false,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                            borderSide: BorderSide(
                                color: ThemeColors.primary, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            borderSide: BorderSide(
                              color: ThemeColors.primary,
                              width: 2,
                            ),
                          ),
                        ),
                        initialCountryCode: 'IN',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.065),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 20),
                    child: Center(
                      heightFactor: 1,
                      child: GRoundedButton(
                        onPressed: () => model.performSendOtp(),
                        color: ThemeColors.primary,
                        child: Text("Sign In"),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.065),
                  Column(
                    children: <Widget>[
                      Text(
                        "by signing in you agree to our ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: width * 0.04,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Terms and Conditions",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                    style: TextStyle(
                                      fontSize: width * 0.04,
                                      decoration: TextDecoration.underline,
                                      color: ThemeColors.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: " and ",
                                style: TextStyle(
                                  fontSize: width * 0.04,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Service Policy.",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                    style: TextStyle(
                                      fontSize: width * 0.04,
                                      decoration: TextDecoration.underline,
                                      color: ThemeColors.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
