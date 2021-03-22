import 'package:customer/src/app/locator.dart';
import 'package:customer/src/app/router.gr.dart';
// import 'package:customer/src/core/services/authentication_service.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  // Services
  NavigationService _navigationService = locator<NavigationService>();
  // AuthenticationService _authenticationService =
  //     locator<AuthenticationService>();

  void initialize() {
    _handleStartupLogic();
  }

  Future _handleStartupLogic() async {
    // TODO: build logic
    // final SharedPreferences _sharedPreferences =
    //     await SharedPreferences.getInstance();
    // final bool isAppFirstTimeInstalled =
    //     _sharedPreferences.getBool('isFirstOpenAfterInstallation') ?? true;
    // final bool isUserLoggedIn = _authenticationService.isUserLoggedIn;

    String routeToNavigate = Routes.signInPage;

    // if (isAppFirstTimeInstalled) {
    //   // routeToNavigate = Routes.onBoardingScreen;
    //   await _sharedPreferences.setBool("isFirstOpenAfterInstallation", false);
    // } else if (isUserLoggedIn) {
    //   routeToNavigate = Routes.homePage;
    // } else {
    //   // TODO: check back here
    //   routeToNavigate = Routes.loginPage;
    // }
    await Future.delayed(Duration(seconds: 3));
    _navigationService.replaceWith(routeToNavigate);
  }
}
