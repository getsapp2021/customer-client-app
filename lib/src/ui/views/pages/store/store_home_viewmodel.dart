import 'package:customer/src/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StoreHomeViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();

  void navigateTo(String routeName){
    _navigationService.navigateTo(routeName);
  }
}
