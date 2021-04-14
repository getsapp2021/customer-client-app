import 'package:customer/src/app/locator.dart';
import 'package:customer/src/core/services/authentication_service.dart';
import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/ui/views/pages/home/home_viewmodel.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_button.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_textfield.dart';
import 'package:customer/src/ui/views/widgets/g_store_category_item.dart';
import 'package:customer/src/ui/views/widgets/g_store_item.dart';
import 'package:customer/src/ui/views/widgets/service_item.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatelessWidget {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                flexibleSpace: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 8, 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                              flex: 1,
                              child: GRoundedButton(
                                child: Text(
                                  "Home",
                                  style: TextStyle(color: ThemeColors.white),
                                ),
                                color: ThemeColors.primary,
                              )),
                          Flexible(
                            flex: 3,
                            child: GRoundedTextField(
                              hintText: "  Search Something",
                              fillColor: ThemeColors.white,
                            ),
                          )
                        ]),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                    ),
                                    Text("Stores")
                                  ],
                                ),
                                SizedBox(width: 20),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                    ),
                                    Text("Services")
                                  ],
                                ),
                                SizedBox(width: 20),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                    ),
                                    Text("Food")
                                  ],
                                ),
                                SizedBox(width: 20),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                    ),
                                    Text("Hyperlocal")
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 30,
                        child: Row(
                          children: [
                            Text(
                              "Stores Near You",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Container(
                          child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GStoreItem(),
                            SizedBox(width: 30),
                            GStoreItem(),
                            SizedBox(width: 30),
                            GStoreItem(),
                          ],
                        ),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 30,
                        child: Row(
                          children: [
                            Text(
                              "Stores Categories",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Container(
                            child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GStoreCategoryItem(),
                              SizedBox(width: 30),
                              GStoreCategoryItem(),
                              SizedBox(width: 30),
                              GStoreCategoryItem(),
                              SizedBox(width: 30),
                              GStoreCategoryItem(),
                            ],
                          ),
                        )),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 30,
                        child: Row(
                          children: [
                            Text(
                              "Popular Services",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Container(
                            child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ServiceItem(),
                              SizedBox(width: 30),
                              ServiceItem(),
                              SizedBox(width: 30),
                              ServiceItem(),
                              SizedBox(width: 30),
                              ServiceItem(),
                            ],
                          ),
                        )),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 30,
                        child: Row(
                          children: [
                            Text(
                              "Popular Restaurants",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: GStoreItem(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: GStoreItem(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: GStoreItem(),
                    ),
                  ],
                ),
              ),
            ));
  }
}
