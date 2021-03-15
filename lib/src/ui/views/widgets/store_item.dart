import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class StoreItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 270,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Placeholder(
            color: Colors.greenAccent,
            fallbackHeight: 150,
            fallbackWidth: 300,
          ),
          "Istore Inorbit Mall".text.xl2.make().px8(),
          Row(
            children: [
              Icon(Icons.card_giftcard),
              SizedBox(width: 8),
              "Electronics".text.xl.make(),
            ],
          ).px8(),
          Row(
            children: [
              "4.5".text.make(),
              SizedBox(width: 200),
              Column(
                children: [
                  Icon(Icons.location_on),
                  "2.3 KM".text.make(),
                ],
              ),
            ],
          ).px8(),
        ],
      ),
    );
  }
}
