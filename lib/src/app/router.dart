import 'package:auto_route/auto_route_annotations.dart';
import 'package:customer/src/ui/views/pages/auth/access_location_permission_page.dart';
import 'package:customer/src/ui/views/pages/auth/edit_profile_page.dart';
import 'package:customer/src/ui/views/pages/auth/signin_page.dart';
import 'package:customer/src/ui/views/pages/home/home_page.dart';
import 'package:customer/src/ui/views/pages/services/services_checkout_page.dart';
import 'package:customer/src/ui/views/pages/services/services_details_page.dart';
import 'package:customer/src/ui/views/pages/startup/startup_page.dart';
import 'package:customer/src/ui/views/pages/auth/otp_page.dart';
import 'package:customer/src/ui/views/pages/auth/search_location_page.dart';
import 'package:customer/src/ui/views/pages/auth/search_location_result_detail_page.dart';
import 'package:customer/src/ui/views/pages/store/store_details_page.dart';
import 'package:customer/src/ui/views/pages/store/store_home_page.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: StartupPage),
  MaterialRoute(page: HomePage),
  MaterialRoute(page: SignInPage),
  MaterialRoute(page: OtpPage),
  MaterialRoute(page: EditProfilePage),
  MaterialRoute(page: AccessLocationPermissionPage),
  MaterialRoute(page: SearchLocationPage),
  MaterialRoute(page: SearchLocationResultDetailPage),
  MaterialRoute(page: StoreHomePage),
  MaterialRoute(page: StoreDetailsPage),
  MaterialRoute(page: ServicesDetailsPage),
  MaterialRoute(page: ServicesCheckoutPage),
])
class $Router {}
