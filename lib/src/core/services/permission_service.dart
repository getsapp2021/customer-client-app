import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  void checkLocationPermission() async {
    var locationStatus = await Permission.location.status;
    var locationAlwaysStatus = await Permission.locationAlways.status;
    print(locationStatus);
    print(locationAlwaysStatus);
    if (!locationStatus.isGranted) {
      await Permission.location.request();
    }
    if (!locationAlwaysStatus.isGranted) {
      await Permission.locationAlways.request();
    }
  }
}
