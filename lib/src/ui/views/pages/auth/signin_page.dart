import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/ui/utils/validators/auth_validator.dart';
import 'package:customer/src/ui/views/pages/auth/signin_viewmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
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
                horizontal: 20, vertical:60),
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/auth/sign_in_clipart.png",
                  width: 250,
                  // alignment: Alignment.center,
                ),
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hey There!",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: ThemeColors.fontColor,

                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Login with your mobile number",
                    style: TextStyle(
                      fontSize: 17,
                      color: ThemeColors.fontColor,
                    ),
                  ),
                ),
                SizedBox(height: 45),
                Form(
                  key: model.phoneNumberFormKey,
                  child: IntlPhoneField(
                    validator: AuthValidator.phoneValidator,
                    showDropdownIcon: false,
                    decoration: InputDecoration(
                      hintText: "9999999999",
                      contentPadding: EdgeInsets.all(15),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide:
                            BorderSide(color: ThemeColors.primary, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                SizedBox(height: 45),
                model.isBusy ? GCircularProgressIndicator() : GRoundedButton(
                  onPressed: () => model.performSendOtp(),
                  color: ThemeColors.primary,
                  text: "Sign In",
                ),
                SizedBox(height: 45),
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
                SizedBox(
                  height: 55,
                ),
                Image.asset(
                  "assets/images/auth/gets.png",
                  width: 200,
                  // alignment: Alignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
