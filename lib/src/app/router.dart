import 'package:auto_route/auto_route_annotations.dart';
import 'package:customer/src/ui/views/pages/auth/signin_page.dart';
import 'package:customer/src/ui/views/pages/home/home_page.dart';
import 'package:customer/src/ui/views/pages/startup/startup_page.dart';
import 'package:customer/src/ui/views/pages/auth/otp_page.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: StartupPage),
  MaterialRoute(page: HomePage),
  MaterialRoute(page: SignInPage),
  MaterialRoute(page: OtpPage),
])
class $Router {}
