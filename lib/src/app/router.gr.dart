// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/pages/auth/access_location_permission_page.dart';
import '../ui/views/pages/auth/otp_page.dart';
import '../ui/views/pages/auth/search_location_page.dart';
import '../ui/views/pages/auth/signin_page.dart';
import '../ui/views/pages/home/home_page.dart';
import '../ui/views/pages/startup/startup_page.dart';

class Routes {
  static const String startupPage = '/startup-page';
  static const String homePage = '/home-page';
  static const String signInPage = '/sign-in-page';
  static const String otpPage = '/otp-page';
  static const String accessLocationPermissionPage =
      '/access-location-permission-page';
  static const String searchLocationPage = '/search-location-page';
  static const all = <String>{
    startupPage,
    homePage,
    signInPage,
    otpPage,
    accessLocationPermissionPage,
    searchLocationPage,
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
    RouteDef(Routes.accessLocationPermissionPage,
        page: AccessLocationPermissionPage),
    RouteDef(Routes.searchLocationPage, page: SearchLocationPage),
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
      return MaterialPageRoute<dynamic>(
        builder: (context) => OtpPage(),
        settings: data,
      );
    },
    AccessLocationPermissionPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AccessLocationPermissionPage(),
        settings: data,
      );
    },
    SearchLocationPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SearchLocationPage(),
        settings: data,
      );
    },
  };
}
