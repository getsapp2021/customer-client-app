import 'package:customer/src/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class GStoreCategoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 100,
      decoration: BoxDecoration(
          color: ThemeColors.primary, borderRadius: BorderRadius.circular(20)),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: ThemeColors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Grocery",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
