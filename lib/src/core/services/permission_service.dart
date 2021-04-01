import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<bool> get isAllRequiredLocationPermissionsGranted async {
    final locationPermission = await Permission.location.status;
    final locationAlwaysPermission = await Permission.locationAlways.status;
    return locationPermission.isGranted && locationAlwaysPermission.isGranted;
  }

  Future<bool> askForLocationPermission() async {
    var locationPermission = await Permission.location.status;
    var locationAlwaysPermission = await Permission.locationAlways.status;

    if (!locationPermission.isGranted) {
      await Permission.location.request();
    }

    if (!locationAlwaysPermission.isGranted) {
      await Permission.locationAlways.request();
    }

    return locationPermission.isGranted && locationAlwaysPermission.isGranted;
  }
}
