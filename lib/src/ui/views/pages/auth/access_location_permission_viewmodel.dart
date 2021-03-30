import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:customer/src/app/locator.dart';
import 'package:customer/src/core/services/permission_service.dart';

class AccessLocationPermissionViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  PermissionService _permissionService = locator<PermissionService>();

  void navigateTo(String routeName) {
    _navigationService.navigateTo(routeName);
  }

  void askPermission() {
    _permissionService.checkLocationPermission();
  }
}
