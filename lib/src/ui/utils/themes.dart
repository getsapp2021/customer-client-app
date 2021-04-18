import 'package:customer/src/ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';

class GTheme {

  /// TODO: Make design system - combinations of color, fontSize, fontWeight
  /// font weights: extraLight(200), light(300), regular(400), medium(500), semiBold(600), bold(700)
  /// fontSize: title(?), heading1(?), heading2(?), heading3(?), heading4(?), heading5(?),heading6(?) ,body(?)
  /// colors: primary, body(#7E8AA1), bodySecondary(grey)

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primaryColor: ThemeColors.primary,
        accentColor: ThemeColors.primaryLight,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "poppins",
        scaffoldBackgroundColor: ThemeColors.pageBackground,
        bottomAppBarColor: ThemeColors.white,
        dividerColor: ThemeColors.grey,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: ThemeColors.body),
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData();
}


// body
TextStyle kTSPrimaryColor = TextStyle(color: ThemeColors.primary);

TextStyle kTSPrimaryColorLight =
    TextStyle(color: ThemeColors.primary, fontWeight: FontWeight.w300);
TextStyle kTSPrimaryColorSemiBold =
    TextStyle(color: ThemeColors.primary, fontWeight: FontWeight.w600);
TextStyle kTSPrimaryColorBold =
    TextStyle(color: ThemeColors.primary, fontWeight: FontWeight.bold);

TextStyle kTSBodyColor = TextStyle(color: ThemeColors.body);
TextStyle kTSBodyColorMedium = TextStyle(color: ThemeColors.body,  fontWeight: FontWeight.w500);
TextStyle kTSBodyColorSemiBold = TextStyle(color: ThemeColors.body,  fontWeight: FontWeight.w600);
TextStyle kTSBodyColorBold = TextStyle(color: ThemeColors.body,  fontWeight: FontWeight.bold);