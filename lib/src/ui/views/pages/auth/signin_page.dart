import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/ui/utils/validators/auth_validator.dart';
import 'package:customer/src/ui/views/pages/auth/signin_viewmodel.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

class SigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SigninViewModel>.nonReactive(
      viewModelBuilder: () => SigninViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Placeholder(color: Colors.green).h32(context),
                // Center(child: "g".text.xl6.maxFontSize(64).bold.make()),
                SizedBox(height: 20),
                "Hey There!".text.xl3.bold.make(),
                "Login with mobile number".text.xl.make(),

                Form(
                  key: model.phoneNumberFormKey,
                  child: IntlPhoneField(
                    autoValidate: false,
                    validator: AuthValidator.phoneValidator,
                    showDropdownIcon: false,
                    maxLength: 10,
                    decoration: InputDecoration(
                      contentPadding: Vx.m12,
                      hintText: "99999 99999",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    onSaved: (phone) => model.phoneNumber = phone,
                  ),
                ),

                SizedBox(height: 15),
                SizedBox(height: 15),
                model.isBusy
                    ? CircularProgressIndicator()
                    : GRoundedButton(
                        onPressed: () => model.performSendOtp(),
                        color: ThemeColors.primary,
                        text: "Sign In",
                      ),
                SizedBox(height: 25),
                Center(
                  child:
                      "by signing in you agree to our \n Terms and Conditions and Service Policy."
                          .text
                          .align(TextAlign.center)
                          .make(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
