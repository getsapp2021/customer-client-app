import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:customer/src/app/locator.dart';

class SigninViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  void navigateTo(String routeName) {
    _navigationService.navigateTo(routeName);
  }
}
