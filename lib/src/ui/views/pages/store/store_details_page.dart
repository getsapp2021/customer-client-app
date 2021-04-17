import 'package:customer/src/ui/utils/theme_colors.dart';
import 'package:customer/src/ui/views/pages/store/store_viewmodel.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_button.dart';
import 'package:customer/src/ui/views/widgets/g_search_bar.dart';
import 'package:customer/src/ui/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class StoreDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _showBottomSheet() {
      showModalBottomSheet(
        enableDrag: true,
        context: context,
        backgroundColor: ThemeColors.white,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                              height: 100, width: 60, child: Placeholder()),
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            children: [
                              Text(
                                "Apple Iphone 12",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                  "Lorem Ipsum \nLorem Ipsum \nLorem Ipsum \nLorem Ipsum")
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Capacity",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GRoundedButton(
                          borderRadius: 10,
                          height: 40,
                          width: 80,
                          child: Text("64GB"),
                          borderColor: ThemeColors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GRoundedButton(
                          borderRadius: 10,
                          height: 40,
                          width: 80,
                          child: Text("128GB"),
                          borderColor: ThemeColors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GRoundedButton(
                          borderRadius: 10,
                          height: 40,
                          width: 80,
                          child: Text("256GB"),
                          borderColor: ThemeColors.grey,
                        ),
                      ],
                    ),
                    Text(
                      "Color",
                      style: TextStyle(fontSize: 18),
                    ),
                    Row(
                      children: [
                        GRoundedButton(
                          height: 50,
                          width: 50,
                          borderRadius: 10,
                          color: ThemeColors.primary,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GRoundedButton(
                          height: 50,
                          width: 50,
                          borderRadius: 10,
                          color: ThemeColors.body,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GRoundedButton(
                          height: 50,
                          width: 50,
                          borderRadius: 10,
                          color: ThemeColors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GRoundedButton(
                          height: 50,
                          width: 50,
                          borderRadius: 10,
                          color: ThemeColors.pageBackground,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: GRoundedButton(
                        height: 50,
                        width: 0.8 * double.infinity,
                        borderRadius: 10,
                        color: ThemeColors.primary,
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Payout",
                                    style: TextStyle(
                                        fontSize: 12, color: ThemeColors.white),
                                  ),
                                  Text(
                                    "Rs 99,999.99",
                                    style: TextStyle(
                                        fontSize: 16, color: ThemeColors.white),
                                  ),
                                ],
                              ),
                              Text(
                                "ADD TO CART",
                                style: TextStyle(
                                    fontSize: 16, color: ThemeColors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => StoreViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: GSearchBar(),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
                                      style:
                                          TextStyle(color: ThemeColors.white),
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
                                      style:
                                          TextStyle(color: ThemeColors.white),
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
            ),
            ExpansionTile(
              title: Text(
                "BestSellers",
                style: TextStyle(
                    color: ThemeColors.body,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              children: [
                GestureDetector(onTap: _showBottomSheet, child: ProductItem()),
                ProductItem(),
                ProductItem(),
                ProductItem(),
              ],
            ),
            ExpansionTile(
              title: Text(
                "Mobile Phones",
                style: TextStyle(
                    color: ThemeColors.body,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              children: [
                ProductItem(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
