import 'package:flutter/material.dart';
import 'package:customer/src/ui/utils/theme_colors.dart';

import '../../utils/theme_colors.dart';

class GTextFormField extends StatelessWidget {
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  final TextEditingController controller;
  final bool enabled;
  final String Function(String) validator;
  final Color textColor;
  final FocusNode focusNode;
  final bool enableInteractiveSelection;
  final void Function(String) onChanged;

  const GTextFormField({
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.controller,
    this.enabled = true,
    this.validator,
    this.textColor, this.focusNode, this.enableInteractiveSelection = true, this.onChanged,
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
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        onChanged: onChanged,
        enableInteractiveSelection: enableInteractiveSelection,
        focusNode: focusNode,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        enabled: enabled,
        validator: validator,
        style: TextStyle(
          color: textColor,
        ),
        controller: controller,
        readOnly: !enabled,

        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.all(16),
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: ThemeColors.white),
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: const BorderSide(color: ThemeColors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: ThemeColors.primary),
          ),
        ),
      ),
    );
  }
}
