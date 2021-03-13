import 'package:customer/src/ui/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    // Flexible(
                    //   flex: 1,
                    //   child: TextField(
                    //       decoration: InputDecoration(
                    //           hintText: "99999 99999",
                    //           border: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(50)))),
                    // ),
                  ],
                ),
              ),
              // TextField(
              //   decoration: InputDecoration(
              //     labelText: "99999 99999",
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(50)),
              //   ),
              // ),
              SizedBox(
                height: 15,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(height: 15),
              CustomButton(
                color: Colors.black,
                icon: Icon(
                  Icons.apps,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 15),
              CustomButton(color: Colors.blue, icon: Icon(Icons.face)),
              SizedBox(height: 15),
              CustomButton(color: Colors.green, icon: Icon(Icons.g_translate)),
            ],
          )),
    ));
  }
}
