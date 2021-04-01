import 'package:customer/src/app/locator.dart';
import 'package:customer/src/core/services/authentication_service.dart';
import 'package:customer/src/core/utils/enums/auth_status.dart';
import 'package:stacked/stacked.dart';

class StartupViewModel extends StreamViewModel<AuthStatus> {
  AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  @override
  Stream<AuthStatus> get stream => _authenticationService.onAuthStatusChanged;
  bool showSplashScreen = true;

  @override
  void initialise() {
    super.initialise();
    delayStartupPage();
  }

  Future<void> delayStartupPage({int seconds = 3}) async {
    await Future.delayed(Duration(seconds: seconds));
    showSplashScreen = false;
    notifyListeners();
  }
}