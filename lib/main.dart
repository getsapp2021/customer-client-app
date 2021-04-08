import 'package:customer/src/app/router.gr.dart';
import 'package:customer/src/ui/utils/themes.dart';
import 'package:customer/src/ui/views/pages/auth/access_location_permission_page.dart';
import 'package:customer/src/ui/views/pages/auth/otp_page.dart';
import 'package:customer/src/ui/views/pages/auth/signin_page.dart';
import 'package:customer/src/ui/views/pages/profile/edit_profile_page.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:customer/src/app/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  // setupDialogUi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Gets Customer App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      // home: AccessLocationPermissionPage(),
      initialRoute: Routes.startupPage,
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,

    );
  }
}
