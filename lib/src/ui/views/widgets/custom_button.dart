import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Icon icon;

  const CustomButton({Key key, this.color, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(50)),
      child: Center(
        child: icon,
      ),
    );
  }
}
