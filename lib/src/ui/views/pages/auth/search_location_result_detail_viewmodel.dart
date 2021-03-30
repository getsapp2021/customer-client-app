import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:customer/src/core/services/location_service.dart';
import 'package:customer/src/app/locator.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchLocationResultDetailViewModel extends BaseViewModel {
  LocationService _locationService = locator<LocationService>();
  NavigationService _navigationService = locator<NavigationService>();
  TextEditingController _placeController = TextEditingController();
  TextEditingController _buildNoController = TextEditingController();
  TextEditingController _landmarkController = TextEditingController();
  GoogleMapController gmapController;

  TextEditingController get placeController => _placeController;
  TextEditingController get buildNoController => _buildNoController;
  TextEditingController get landmarkController => _landmarkController;
  // GoogleMapController get gmapController => _gmapController;

  Set<Marker> markers = {};
  Marker tmp;

  void initialise(Coordinates coordinate) {
    LatLng pos = LatLng(coordinate.latitude, coordinate.longitude);
    tmp = Marker(
      markerId: MarkerId("Initial Home"),
      position: pos,
      draggable: true,
    );
   markers.add(tmp);
    getAddressFromCoordinates(coordinate);
  }

  List<Address> address;
  void onMapCreated(GoogleMapController controller) {
    gmapController = controller;
  }

  void addMarker(Marker newMarker) {
    markers.add(newMarker);
    notifyListeners();
  }

  void resetMarkers() {
    markers = {};
    notifyListeners();
  }

  void getAddressFromCoordinates(Coordinates pos) async {
    address = await _locationService.getAddressFromCoordinates(pos);
    buildNoController.text = address[1].featureName;
    placeController.text = address[1].addressLine;
    landmarkController.text = address[1].subLocality;
    notifyListeners();
  }

  void navigateTo(String routeName) {
    _navigationService.navigateTo(routeName);
  }
}
