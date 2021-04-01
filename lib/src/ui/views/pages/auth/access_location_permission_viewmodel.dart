import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:customer/src/app/locator.dart';
import 'package:customer/src/core/services/permission_service.dart';

class AccessLocationPermissionViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  PermissionService _permissionService = locator<PermissionService>();

  void initialise() async {
    await _permissionService.isAllRequiredLocationPermissionsGranted;
    print("directly redirecting");
  }

  void navigateTo(String routeName) {
    _navigationService.navigateTo(routeName);
  }

  void askLocationPermission() async {
    final bool isAllRequiredLocationPermissionsGranted =  await _permissionService.askForLocationPermission();
    if(isAllRequiredLocationPermissionsGranted){
      print("askLocationPermission: on All location permission Granted");
    }else{
      print("askLocationPermission: on All location permission NOT Granted");
    }
  }
}
