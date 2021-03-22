import 'package:customer/src/app/router.gr.dart';
import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/ui/views/pages/auth/signin_viewmodel.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_button.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';
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
        backgroundColor: ThemeColors.background,
        body: OrientationBuilder(
          builder: (context, orientation) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.1,
                  ),
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
                    child: Column(
                      children: [
                        "Hey There!".text.xl3.bold.make(),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(width / 20, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        "Login with mobile number".text.xl.make(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.065,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                          flex: 1,
                          child: Container(
                            height: height * 0.065,
                            // height: 50,
                            padding: EdgeInsets.fromLTRB(width / 20, 0, 10, 0),
                            child: IntlPhoneField(
                              showDropdownIcon: false,
                              decoration: InputDecoration(
                                  // hintText: "99999 99999",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        50.0,
                                      ),
                                    ),
                                    borderSide: BorderSide(
                                        color: ThemeColors.primary, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50.0)),
                                    borderSide: BorderSide(
                                        color: ThemeColors.primary, width: 2),
                                  )),
                              initialCountryCode: 'IN',
                              onChanged: (phone) {
                                print(phone.completeNumber);
                              },
                            ),
                          )),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.065,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 20),
                    child: Center(
                      heightFactor: 1,
                      child: GRoundedButton(
                        onPressed: () => model.navigateTo(Routes.otpPage),
                        color: ThemeColors.primary,
                        text: "Sign In",
                      ),
                    ),
                  ),
                  Center(
                    heightFactor: 3,
                    child:
                        "by signing in you agree to our \n Terms and Conditions and Service Policy."
                            .text
                            .align(TextAlign.center)
                            .make(),
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
