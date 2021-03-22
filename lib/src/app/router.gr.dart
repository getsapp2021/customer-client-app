// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/pages/auth/edit_profile_page.dart';
import '../ui/views/pages/auth/otp_page.dart';
import '../ui/views/pages/auth/signin_page.dart';
import '../ui/views/pages/home/home_page.dart';
import '../ui/views/pages/startup/startup_page.dart';

class Routes {
  static const String startupPage = '/startup-page';
  static const String homePage = '/home-page';
  static const String signInPage = '/sign-in-page';
  static const String otpPage = '/otp-page';
  static const String editProfilePage = '/edit-profile-page';
  static const all = <String>{
    startupPage,
    homePage,
    signInPage,
    otpPage,
    editProfilePage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupPage, page: StartupPage),
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.signInPage, page: SignInPage),
    RouteDef(Routes.otpPage, page: OtpPage),
    RouteDef(Routes.editProfilePage, page: EditProfilePage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    StartupPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartupPage(),
        settings: data,
      );
    },
    HomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePage(),
        settings: data,
      );
    },
    SignInPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignInPage(),
        settings: data,
      );
    },
    OtpPage: (data) {
      final args = data.getArgs<OtpPageArguments>(
        orElse: () => OtpPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => OtpPage(
          countryCode: args.countryCode,
          phoneNumber: args.phoneNumber,
        ),
        settings: data,
      );
    },
    EditProfilePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => EditProfilePage(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// OtpPage arguments holder class
class OtpPageArguments {
  final String countryCode;
  final String phoneNumber;
  OtpPageArguments({this.countryCode, this.phoneNumber});
}
