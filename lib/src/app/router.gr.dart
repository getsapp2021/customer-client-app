// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';

import '../ui/views/pages/auth/access_location_permission_page.dart';
import '../ui/views/pages/auth/edit_profile_page.dart';
import '../ui/views/pages/auth/otp_page.dart';
import '../ui/views/pages/auth/search_location_page.dart';
import '../ui/views/pages/auth/search_location_result_detail_page.dart';
import '../ui/views/pages/auth/signin_page.dart';
import '../ui/views/pages/home/home_page.dart';
import '../ui/views/pages/services/services_checkout_page.dart';
import '../ui/views/pages/services/services_details_page.dart';
import '../ui/views/pages/startup/startup_page.dart';
import '../ui/views/pages/store/store_details_page.dart';
import '../ui/views/pages/store/store_home_page.dart';

class Routes {
  static const String startupPage = '/startup-page';
  static const String homePage = '/home-page';
  static const String signInPage = '/sign-in-page';
  static const String otpPage = '/otp-page';
  static const String editProfilePage = '/edit-profile-page';
  static const String accessLocationPermissionPage =
      '/access-location-permission-page';
  static const String searchLocationPage = '/search-location-page';
  static const String searchLocationResultDetailPage =
      '/search-location-result-detail-page';
  static const String storeHomePage = '/store-home-page';
  static const String storeDetailsPage = '/store-details-page';
  static const String servicesDetailsPage = '/services-details-page';
  static const String servicesCheckoutPage = '/services-checkout-page';
  static const all = <String>{
    startupPage,
    homePage,
    signInPage,
    otpPage,
    editProfilePage,
    accessLocationPermissionPage,
    searchLocationPage,
    searchLocationResultDetailPage,
    storeHomePage,
    storeDetailsPage,
    servicesDetailsPage,
    servicesCheckoutPage,
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
    RouteDef(Routes.accessLocationPermissionPage,
        page: AccessLocationPermissionPage),
    RouteDef(Routes.searchLocationPage, page: SearchLocationPage),
    RouteDef(Routes.searchLocationResultDetailPage,
        page: SearchLocationResultDetailPage),
    RouteDef(Routes.storeHomePage, page: StoreHomePage),
    RouteDef(Routes.storeDetailsPage, page: StoreDetailsPage),
    RouteDef(Routes.servicesDetailsPage, page: ServicesDetailsPage),
    RouteDef(Routes.servicesCheckoutPage, page: ServicesCheckoutPage),
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
    SearchLocationResultDetailPage: (data) {
      final args =
          data.getArgs<SearchLocationResultDetailPageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            SearchLocationResultDetailPage(coordinate: args.coordinate),
        settings: data,
      );
    },
    StoreHomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StoreHomePage(),
        settings: data,
      );
    },
    StoreDetailsPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StoreDetailsPage(),
        settings: data,
      );
    },
    ServicesDetailsPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ServicesDetailsPage(),
        settings: data,
      );
    },
    ServicesCheckoutPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ServicesCheckoutPage(),
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

/// SearchLocationResultDetailPage arguments holder class
class SearchLocationResultDetailPageArguments {
  final Coordinates coordinate;
  SearchLocationResultDetailPageArguments({@required this.coordinate});
}
