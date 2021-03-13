import 'package:customer/src/ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primaryColor: ThemeColors.primary,
        fontFamily: "poppins",
        cardColor: Colors.white,
        buttonColor: darkBluishColor,
        canvasColor: creamColor,
        accentColor: darkCreamColor,
        appBarTheme: AppBarTheme(textTheme: Theme.of(context).textTheme),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: "poppins",
        cardColor: Colors.black,
        buttonColor: lightBluishColor,
        canvasColor: darkCreamColor,
        accentColor: creamColor,
      );

  //Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}

class ThemeColor {}
