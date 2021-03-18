import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/ui/views/pages/auth/signin_viewmodel.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:customer/src/app/router.gr.dart';

class SigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SigninViewModel>.reactive(
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
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                          flex: 1,
                          child: Container(
                            child: IntlPhoneField(
                              showDropdownIcon: false,
                              decoration: InputDecoration(
                                  hintText: "99999 99999",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              initialCountryCode: 'IN',
                              onChanged: (phone) {
                                print(phone.completeNumber);
                              },
                            ),
                          )),
                      SizedBox(
                        width: 10.0,
                      ),

                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(height: 15),
                GRoundedButton(
                  onPressed: () =>
                      model.navigateTo(Routes.accessLocationPermissionPage),
                  color: ThemeColors.primary,
                  textColor: ThemeColors.white,
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
            )),
      )),
    );
  }
}
