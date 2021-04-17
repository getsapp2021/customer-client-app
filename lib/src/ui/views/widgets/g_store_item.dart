import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/ui/views/widgets/g_icon_icons.dart';
import 'package:flutter/material.dart';

class GStoreItem extends StatelessWidget {
  GStoreItem({
    this.isDelivery,
    this.notDeliveryAndFeatured,
  });

  final bool isDelivery;
  final bool notDeliveryAndFeatured;

  // final double height;
  // final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Flexible(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/flags/mn.png"),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                ),
                notDeliveryAndFeatured == false
                    ? Container()
                    : Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: ThemeColors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            height: 20,
                            width: 60,
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text(
                                isDelivery == false ? "featured" : "Delivery",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: ThemeColors.primary),
                              ),
                            ),
                          ),
                        ),
                      ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: ThemeColors.white,
                          borderRadius: BorderRadius.circular(5)),
                      height: 20,
                      width: 70,
                      child: Text(
                        "3.3 KM",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.primary),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: ThemeColors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Store Name",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 5,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          GIcon.shop,
                          size: 10,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Electronics",
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: ThemeColors.primary,
                                    borderRadius: BorderRadius.circular(50)),
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.all(5),
                                height: 25,
                                width: 50,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star_border,
                                      size: 15,
                                      color: ThemeColors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "4.3",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: ThemeColors.white,
                                      ),
                                    ),
                                  ],
                                ))),
                        Align(
                            alignment: Alignment.topRight,
                            child: Column(children: [
                              Text(
                                "Starting at",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: ThemeColors.body,
                                ),
                              ),
                              Text(
                                "₹333.33",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: ThemeColors.body,
                                    fontWeight: FontWeight.w800),
                              )
                            ]))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GStoreTopBrands extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/brands/nike.png",
              ),
              fit: BoxFit.fitHeight,
            ),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
