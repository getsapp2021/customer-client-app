import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey),
      child: Column(
        children: [
          Placeholder(
            fallbackHeight: 150,
            fallbackWidth: 120,
            color: Colors.lightGreen,
          ),
          "Grocery".text.xl2.make(),
        ],
      ),
    );
  }
}
