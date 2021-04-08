import 'package:flutter/material.dart';
import 'package:customer/src/ui/utils/colors.dart';

import '../../../../utils/colors.dart';

class ProfileTextField extends StatelessWidget {
  final Icon icon;
  final String hintText;
  final TextEditingController controller;
  final bool enabled;
  final String Function(String) validator;
  final Color textColor;

  const ProfileTextField({
    this.icon,
    this.hintText,
    this.controller,
    this.enabled = true,
    this.validator,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration:  BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.06),
            blurRadius: 10.0,
            offset: Offset(2, 3),
          ),
        ],
        // color: ThemeColors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        enabled: enabled,
        validator: validator,
        style: TextStyle(
          color: textColor,
        ),
        controller: controller,
        readOnly: !enabled,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16),
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(color: ThemeColors.white),
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: const BorderSide(color: ThemeColors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(color: ThemeColors.primary),
          ),
        ),
      ),
    );
  }
}
