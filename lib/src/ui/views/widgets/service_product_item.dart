import 'package:customer/src/ui/views/widgets/g_add_to_cart.dart';
import 'package:flutter/material.dart';

class ServiceProductItem extends StatelessWidget {
  final Function onTap;

  const ServiceProductItem({Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Haircut", style: TextStyle(fontSize: 16)),
      subtitle: Text("Rs.200", style: TextStyle(fontSize: 14)),
      trailing: GAddToCart(),
      onTap: onTap,
    );
  }
}