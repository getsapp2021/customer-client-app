import 'package:customer/src/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class GRoundedTextField extends StatelessWidget {
  final Color fillColor;
  final Icon fieldIcon;
  final String hintText;
  final TextEditingController controller;
  final Function ontap;
  const GRoundedTextField(
      {Key key,
      this.fillColor,
      this.fieldIcon,
      this.hintText,
      this.controller,
      this.ontap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 300,
        child: TextField(
          controller: controller,
          onTap: () {
            ontap();
          },
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
              prefixIcon: fieldIcon,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              fillColor: fillColor,
              focusColor: fillColor,
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(color: ThemeColors.black)),
        ));
  }
}
