import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/ui/utils/validators/auth_validator.dart';
import 'package:customer/src/ui/views/pages/auth/signin_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'widgets/phone_field.dart';
import 'package:customer/src/ui/views/widgets/gets_common_widgets.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ViewModelBuilder<SigninViewModel>.reactive(
      viewModelBuilder: () => SigninViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: ThemeColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.07, vertical: height * 0.1),
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/auth/sign_in_logo.png",
                  width: width * 0.5,
                  // alignment: Alignment.center,
                ),
                SizedBox(height: height * 0.07),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hey There!",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: width * 0.060,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Login with your mobile number",
                    style: TextStyle(
                      fontSize: width * 0.045,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.065),
                Form(
                  key: model.phoneNumberFormKey,
                  child: IntlPhoneField(
                    validator: AuthValidator.phoneValidator,
                    showDropdownIcon: false,
                    decoration: InputDecoration(
                      hintText: "9999999999",
                      contentPadding: EdgeInsets.all(15),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        borderSide:
                            BorderSide(color: ThemeColors.primary, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        borderSide: BorderSide(
                          color: ThemeColors.primary,
                          width: 2,
                        ),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    onSaved: (value) => model.phoneNumber = value,
                  ),
                ),
                SizedBox(height: 30),
                model.isBusy ? GCircularProgressIndicator() : GRoundedButton(
                  onPressed: () => model.performSendOtp(),
                  color: ThemeColors.primary,
                  text: "Send OTP",
                ),
                SizedBox(height: 60),
                Text(
                  "by signing in you agree to our ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: width * 0.04,
                    color: Colors.black,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: width * 0.04,
                      decoration: TextDecoration.underline,
                      color: ThemeColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: "Terms and Conditions",
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      TextSpan(
                        text: " and ",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: "Service Policy.",
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
