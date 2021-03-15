// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/pages/auth/otp_page.dart';
import '../ui/views/pages/auth/signin_page.dart';
import '../ui/views/pages/home/home_page.dart';
import '../ui/views/pages/startup/startup_page.dart';

class Routes {
  static const String startupPage = '/startup-page';
  static const String homePage = '/home-page';
  static const String signinPage = '/signin-page';
  static const String otpPage = '/otp-page';
  static const all = <String>{
    startupPage,
    homePage,
    signinPage,
    otpPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupPage, page: StartupPage),
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.signinPage, page: SigninPage),
    RouteDef(Routes.otpPage, page: OtpPage),
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
    SigninPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SigninPage(),
        settings: data,
      );
    },
    OtpPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => OtpPage(),
        settings: data,
      );
    },
  };
}
