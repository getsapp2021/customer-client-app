import 'package:customer/src/ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';

class GRoundedButton extends StatelessWidget {
  final Color color;
  final Color borderColor;
  final Icon icon;
  final String text;
  final TextStyle textStyle;
  final Function onPressed;
  const GRoundedButton(
      {Key key,
      this.color,
      this.icon,
      this.text,
      this.borderColor,
      this.textStyle = const TextStyle(color: ThemeColors.white, fontWeight: FontWeight.w600),
      @required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height * 0.065,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            border:
                Border.all(color: borderColor != null ? borderColor : color)),
        child: Center(
          child: icon == null
              ? Text(
                  "$text",
                  style: textStyle,
                )
              : icon,
        ),
      ),
    );
  }
}
