import 'package:customer/src/ui/utils/theme_colors.dart';
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
    return ViewModelBuilder<SigninViewModel>.reactive(
      viewModelBuilder: () => SigninViewModel(),
      builder: (context, model, child) => UnFocusWrapper(
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 50,
              ),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/auth/sign_in_clipart.png",
                    width: 300,
                    // alignment: Alignment.center,
                  ),
                  SizedBox(height: 50),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Hey There!",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: ThemeColors.body,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Login with your mobile number",
                      style: TextStyle(
                        fontSize: 17,
                        color: ThemeColors.body,
                      ),
                    ),
                  ),
                  SizedBox(height: 45),
                  Form(
                    key: model.phoneNumberFormKey,
                    child: IntlPhoneField(
                      maxLength: 10,
                      validator: AuthValidator.phoneValidator,
                      showDropdownIcon: false,
                      decoration: InputDecoration(
                        hintText: "98989 89898",
                        counterText: "",
                        contentPadding: EdgeInsets.all(15),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: ThemeColors.primary, width: 2),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                            color: ThemeColors.primary,
                            width: 2,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                        ),
                      ),
                      initialCountryCode: 'IN',
                      onSaved: (value) => model.phoneNumber = value,
                    ),
                  ),
                  SizedBox(height: 45),
                  model.isBusy
                      ? GCircularProgressIndicator()
                      : GRoundedButton(
                          onPressed: model.performSendOtp,
                          color: ThemeColors.primary,
                          text: "Send OTP",
                        ),
                  SizedBox(height: 45),
                  Text(
                    "by signing in you agree to our ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 15,
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
                    "assets/images/auth/signin_logo.png",
                    width: 130,
                    // alignment: Alignment.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
