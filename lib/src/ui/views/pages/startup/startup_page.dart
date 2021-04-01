import 'package:customer/src/core/utils/enums/auth_status.dart';
import 'package:customer/src/ui/views/pages/auth/signin_page.dart';
import 'package:customer/src/ui/views/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:customer/src/ui/views/pages/startup/splash_page.dart';
import 'package:customer/src/ui/views/pages/startup/startup_viewmodel.dart';

class StartupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      viewModelBuilder: () => StartupViewModel(),
      builder: (context, model, child) => !model.showSplashScreen && model.dataReady
          ? model.data == AuthStatus.loggedOut
              ? SignInPage()
              : HomePage()
          : SplashPage(),
    );
  }
}
