import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class GRoundedButton extends StatelessWidget {
  final Color color;
  final Icon icon;
  final String text;
  final Function onPressed;

  const GRoundedButton(
      {Key key, this.color, this.icon, this.text, @required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: icon == null ? "$text".text.make() : icon,
        ),
      ),
    );
  }
}
