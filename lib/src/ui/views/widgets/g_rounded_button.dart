import 'package:customer/src/ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class GRoundedButton extends StatelessWidget {
  final Color color;
  final Color borderColor;
  final Color textColor;
  final Icon icon;
  final String text;
  final Function onPressed;

  const GRoundedButton(
      {Key key,
      this.color,
      this.icon,
      this.text,
      this.borderColor,
      this.textColor,
      @required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
            border:
                Border.all(color: borderColor != null ? borderColor : color)),
        child: Center(
          child: icon == null
              ? "$text"
                  .text
                  .color(textColor != null ? textColor : ThemeColors.black)
                  .make()
              : icon,
        ),
      ),
    );
  }
}
