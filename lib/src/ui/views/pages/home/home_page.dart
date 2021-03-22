import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/ui/views/widgets/category_item.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_textfield.dart';
import 'package:customer/src/ui/views/widgets/store_item.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Flexible(
              flex: 1,
              child:
                  GRoundedTextField().wh(0.5 * context.screenWidth, 40).px8()),
          Flexible(
              flex: 2,
              child:
                  GRoundedTextField().wh(0.7 * context.screenWidth, 40).px8())
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.wallet_membership,
                        size: 30,
                      ).p16(),
                      "Wallet".text.xl2.make(),
                    ],
                  ),
                  // SizedBox(width: 120),
                  "Rs199.99".text.xl3.make().p16(),
                ],
              ),
            ),
            Container(
              height: 120,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        CircleAvatar().wh(60, 60),
                        "Stores".text.make()
                      ],
                    ).p16(),
                    Column(
                      children: [
                        CircleAvatar().wh(60, 60),
                        "Services".text.make()
                      ],
                    ).p16(),
                    Column(
                      children: [CircleAvatar().wh(60, 60), "Food".text.make()],
                    ).p16(),
                    Column(
                      children: [
                        CircleAvatar().wh(60, 60),
                        "Hyperlocal".text.make()
                      ],
                    ).p16(),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                "Stores near you".text.xl2.make(),
                Icon(Icons.arrow_right),
              ],
            ).px16(),
            StoreItem().px16(),
            SizedBox(height: 30),
            Row(
              children: [
                "Stores Categories".text.xl2.make(),
                Icon(Icons.arrow_right),
              ],
            ).px16(),
            CategoryItem().px16(),
          ],
        ),
      ),
    );
  }
}
