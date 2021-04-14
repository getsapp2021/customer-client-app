import 'package:customer/src/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primaryColor: ThemeColors.primary,
        accentColor: ThemeColors.primaryLight,
        fontFamily: "poppins",
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData();
}
