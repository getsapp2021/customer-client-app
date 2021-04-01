import 'package:customer/src/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class GStoreItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 300,
      decoration: BoxDecoration(
          color: ThemeColors.primary, borderRadius: BorderRadius.circular(20)),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Placeholder(
            color: ThemeColors.white,
          ),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: ThemeColors.white,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Store Name",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 2, 5, 0),
                  child: Row(
                    children: [
                      Icon(Icons.shopping_bag_rounded),
                      Text(
                        "Electronics",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(alignment: Alignment.topLeft, child: Text("4.3")),
                      Align(
                          alignment: Alignment.topRight,
                          child: Column(children: [
                            Icon(Icons.location_on),
                            Text("2.3 KM")
                          ]))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
