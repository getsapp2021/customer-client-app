import 'package:customer/src/app/router.gr.dart';
import 'package:customer/src/ui/utils/theme_colors.dart';
import 'package:customer/src/ui/views/pages/services/service_details_viewmodel.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_button.dart';
import 'package:customer/src/ui/views/widgets/g_search_bar.dart';
import 'package:customer/src/ui/views/widgets/service_product_item.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ServicesDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ServiceDetailsViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: GSearchBar(),
        ),
        body: ListView(
          children: [
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "IVenus Inorbit Mall",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Container(
                              width: 60,
                              height: 30,
                              child: GRoundedButton(
                                onPressed: () {},
                                borderRadius: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.star_border_outlined,
                                          color: ThemeColors.primary),
                                      SizedBox(width: 5),
                                      Text(
                                        "4.6",
                                        style: TextStyle(
                                            color: ThemeColors.primary,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                borderColor: ThemeColors.primary,
                              )),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                width: 60,
                                height: 30,
                                child: GRoundedButton(
                                  borderRadius: 10,
                                  onPressed: () {},
                                  child: Text(
                                    "Open",
                                    style: TextStyle(color: ThemeColors.white),
                                  ),
                                  borderColor: ThemeColors.primary,
                                  color: ThemeColors.primary,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                width: 60,
                                height: 30,
                                child: GRoundedButton(
                                  borderRadius: 10,
                                  onPressed: () {},
                                  child: Text(
                                    "Pickup",
                                    style: TextStyle(color: ThemeColors.white),
                                  ),
                                  borderColor: ThemeColors.primary,
                                  color: ThemeColors.primary,
                                )),
                          ],
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "2.3KM",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Electronics",
                      style: TextStyle(
                          color: ThemeColors.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Lorem Ipsum \nLorem Ipsum \nLorem Ipsum",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            GRoundedButton(
                              height: 50,
                              width: 50,
                              borderColor: ThemeColors.primary,
                              child: Icon(
                                Icons.phone,
                                color: ThemeColors.body,
                              ),
                            ),
                            Text(
                              "Call",
                              style: TextStyle(color: ThemeColors.primary),
                            )
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            GRoundedButton(
                              height: 50,
                              width: 50,
                              borderColor: ThemeColors.primary,
                              child: Icon(
                                Icons.chat,
                                color: ThemeColors.body,
                              ),
                            ),
                            Text(
                              "Chat",
                              style: TextStyle(color: ThemeColors.primary),
                            )
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            GRoundedButton(
                              height: 50,
                              width: 50,
                              borderColor: ThemeColors.primary,
                              child: Icon(
                                Icons.location_on_outlined,
                                color: ThemeColors.body,
                              ),
                            ),
                            Text(
                              "Locate",
                              style: TextStyle(color: ThemeColors.primary),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ExpansionTile(
              title: Text(
                "Gents",
                style: TextStyle(
                    color: ThemeColors.body,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              children: [
                ServiceProductItem(
                  onTap: model.showCheckoutDialog,
                ),
                ServiceProductItem(),
                ServiceProductItem(),
                ServiceProductItem(),
              ],
            ),
            ExpansionTile(
              title: Text(
                "Ladies",
                style: TextStyle(
                    color: ThemeColors.body,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              children: [
                ServiceProductItem(),
                ServiceProductItem(),
                ServiceProductItem(),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: ThemeColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              title: Text(
                "Total Payout",
                style: TextStyle(color: ThemeColors.white),
              ),
              subtitle: Text(
                "Rs.99,999",
                style: TextStyle(color: ThemeColors.white),
              ),
              trailing: TextButton(
                onPressed: () => model.navigateTo(Routes.servicesCheckoutPage),
                child: Text(
                  "BOOK NOW",
                  style: TextStyle(color: ThemeColors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
