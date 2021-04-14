import 'package:customer/src/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class GRoundedButton extends StatelessWidget {
  final Color color;
  final Color borderColor;
  // final Color textColor;
  final Icon icon;
  // final String text;
  // final TextStyle textStyle;
  final Function onPressed;
  final double height;
  final double width;
  final double borderRadius;
  final Widget child;

  const GRoundedButton({Key key, this.color, this.borderColor, this.icon, this.onPressed, this.height, this.width, this.borderRadius, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height == null ? _height * 0.2 : height,
        width: width == null ? _width * 0.2 : width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius == null ? 50 : borderRadius),
            border:
                Border.all(color: borderColor != null ? borderColor : color)),
        child: Center(
          child: icon == null
              ? child
              : icon,
        ),
      ),
    );
  }
}
