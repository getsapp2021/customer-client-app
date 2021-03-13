import 'package:auto_route/auto_route_annotations.dart';
import 'package:customer/src/ui/views/pages/auth/login_page.dart';
import 'package:customer/src/ui/views/pages/home/home_page.dart';
import 'package:customer/src/ui/views/pages/startup/startup_page.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: StartupPage),
  MaterialRoute(page: HomePage),
  MaterialRoute(page: LoginPage),
])
class $Router {}
