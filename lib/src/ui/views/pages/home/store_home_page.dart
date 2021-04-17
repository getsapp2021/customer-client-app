import 'package:customer/src/app/locator.dart';
import 'package:customer/src/core/services/authentication_service.dart';
import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/ui/views/pages/home/home_viewmodel.dart';
import 'package:customer/src/ui/views/widgets/g_icon_icons.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_textfield.dart';
import 'package:customer/src/ui/views/widgets/g_store_item.dart';
import 'package:customer/src/ui/views/widgets/service_item.dart';
import 'package:flutter_svg/svg.dart';
import 'home_bottom_bar.dart';
import 'stores_listview.dart';
import 'stores_model.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StoreHomePage extends StatelessWidget {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  @override
  Widget build(BuildContext context) {
    final Category choice = Category();
    TextStyle bottomtextstyle = TextStyle(
      color: ThemeColors.body,
      fontSize: 10,
    );

    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 170,
          flexibleSpace: Padding(
            padding: EdgeInsets.only(top: 90, left: 10),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on_outlined,
                      color: ThemeColors.white,
                      size: 30,
                    ),
                    Text(
                      "400063",
                      style: TextStyle(fontSize: 15, color: ThemeColors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15.0, left: 5),
                  child: GRoundedTextField(
                    hintText: "  Search for Stores",
                    fillColor: ThemeColors.white,
                    controller: model.searchController,
                    fieldIcon: Icon(
                      Icons.search,
                      color: ThemeColors.body,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0, bottom: 30),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.notifications_outlined,
                    size: 30.0,
                    color: ThemeColors.white,
                  ),
                )),
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Column(
            children: [
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                children: List.generate(
                  choices.length,
                  (index) {
                    return Center(
                      child: SelectCard(choice: choices[index]),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 250,
                width: 390,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nearby Stores",
                          style:
                              TextStyle(fontSize: 15, color: ThemeColors.body),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("View All Pressed");
                          },
                          child: Text(
                            "View All",
                            style: TextStyle(
                                fontSize: 12,
                                color: ThemeColors.body,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) =>
                            Padding(
                          padding: EdgeInsets.only(top: 8, right: 15),
                          child: GStoreItem(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 140,
                width: 392,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Top Brands",
                          style:
                              TextStyle(fontSize: 15, color: ThemeColors.body),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) =>
                            Padding(
                          padding: EdgeInsets.only(top: 8, right: 15),
                          child: GStoreTopBrands(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                height: 250,
                width: 390,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Featured",
                          style:
                              TextStyle(fontSize: 15, color: ThemeColors.body),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("View All Pressed");
                          },
                          child: Text(
                            "View All",
                            style: TextStyle(
                                fontSize: 12,
                                color: ThemeColors.body,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) =>
                            Padding(
                          padding: EdgeInsets.only(top: 8, right: 15),
                          child: GStoreItem(
                            isDelivery: false,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Popular",
                  style: TextStyle(
                    fontSize: 15,
                    color: ThemeColors.body,
                  ),
                ),
              ),
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                padding: EdgeInsets.only(top: 10),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(
                  choices.length,
                  (index) {
                    return GStoreItem();
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: HomeBottomBar(),
      ),
    );
  }
}
