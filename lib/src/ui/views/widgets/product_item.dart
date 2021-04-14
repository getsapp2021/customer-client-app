import 'package:customer/src/ui/views/widgets/g_add_to_cart.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          width: 50,child: Placeholder()),
      title: Text("Apple Iphone 12", style: TextStyle(fontSize: 16)),
      subtitle: Text("Mobile Phone", style: TextStyle(fontSize: 14)),
      trailing: Container(
          child: GAddToCart()),
      );
  }
}