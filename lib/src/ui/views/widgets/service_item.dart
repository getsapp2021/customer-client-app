import 'package:customer/src/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
          color: ThemeColors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Placeholder(),
          ),
          Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Text("Champion Salon",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("4.8"), Text("33 Reviews")],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.shopping_bag_rounded),
                      SizedBox(width: 10),
                      Text("Men's Salon")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      SizedBox(width: 10),
                      Expanded(child: Text("Jetalpur Rd. Vadodara"))
                    ],
                  ),
                ]),
              )),
        ],
      ),
    );
  }
}
