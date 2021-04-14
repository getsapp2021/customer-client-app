import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreProductItemBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Placeholder(),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      Text("Apple Iphone 12", style: TextStyle(fontSize: 18),),
                      Text("Lorem Ipsum \nLorem Ipsum \nLorem Ipsum \nLorem Ipsum")
                    ],
                  ),
                ),
              ],
            ),
            Text("Capacity", style: TextStyle(fontSize: 18),),
            Row(
              children: [
                GRoundedButton(
                  child: Text("64GB"),
                  borderColor: ThemeColors.gray,
                ),
                GRoundedButton(
                  child: Text("128GB"),
                  borderColor: ThemeColors.gray,
                ),
                GRoundedButton(
                  child: Text("256GB"),
                  borderColor: ThemeColors.gray,
                ),
              ],
            ),
            Text("Color", style: TextStyle(fontSize: 18),),
            Row(
              children: [
                GRoundedButton(
                  height: 40,
                  width: 40,
                  color: ThemeColors.primary,
                ),
                GRoundedButton(
                  height: 40,
                  width: 40,
                  color: ThemeColors.primaryLight,
                ),
                GRoundedButton(
                  height: 40,
                  width: 40,
                  color: ThemeColors.white,
                ),
                GRoundedButton(
                  height: 40,
                  width: 40,
                  color: ThemeColors.black,
                )
              ],
            ),
            Center(
              child: GRoundedButton(
                color: ThemeColors.primary,
                child: Row(
                  children: [Column(children: [
                    Text("Total Payout", style: TextStyle(fontSize: 12, color: ThemeColors.white),),
                    Text("Rs 99,999.99", style: TextStyle(fontSize: 16, color: ThemeColors.white),),
                  ],),
                  Text("ADD TO CART", style: TextStyle(fontSize: 16, color: ThemeColors.white),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
