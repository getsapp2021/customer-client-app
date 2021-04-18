import 'package:customer/src/app/helper.dart';
import 'package:customer/src/app/router.gr.dart';
import 'package:customer/src/core/models/location.dart';
import 'package:customer/src/core/models/place.dart';
import 'package:customer/src/core/models/suggestion.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoder/geocoder.dart';
import 'package:stacked/stacked.dart';
import 'package:customer/src/core/services/location_service.dart';
import 'package:customer/src/app/locator.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchLocationViewModel extends BaseViewModel {
  final logger = getLogger("SearchLocationViewModel");

  LocationService _locationService = locator<LocationService>();
  NavigationService _navigationService = locator<NavigationService>();

  final TextEditingController searchLocationTextEditingController =
      TextEditingController();

  String _query = "";
  Location _currentLocation;

  List<PlaceSuggestion> _suggestions = [];

  List<PlaceSuggestion> get suggestions => _suggestions;

  bool get hasSuggestions => _suggestions != null && _suggestions.isNotEmpty;

  void initialise() async {
    final _currentPosition = await _locationService.getCurrentLocation();
    print("_currentPosition: $_currentPosition");
    _currentLocation = Location(
      latitude: _currentPosition.latitude,
      longitude: _currentPosition.longitude,
    );

    _locationService.createNewSession();
  }

  void onInputChanged(String value) async {
    _query = value;
    fetchSuggestions();
  }

  //TODO: error handling
  void fetchSuggestions() async {
    setBusy(true);
    _suggestions =
        await _locationService.fetchSuggestions(_query, _currentLocation);
    setBusy(false);
  }

  void createNewSession() => _locationService.createNewSession();

  Future<Coordinates> placeDetailFromId(String placeId) async {
    Place _place = await _locationService.getPlaceDetailsFromId(placeId);
    return Coordinates(_place.lat, _place.long);
    // return Coordinates(22.305460, 73.131978);
  }

  void navigateToResultPage(String placeId) async {
    Coordinates coordinate = await placeDetailFromId(placeId);
    _navigationService.navigateTo(Routes.searchLocationResultDetailPage,
        arguments:
            SearchLocationResultDetailPageArguments(coordinate: coordinate));
  }

  void clearSearchTextField() {
    searchLocationTextEditingController.clear();
    _suggestions = [];
    setBusy(false);
  }

  @override
  void dispose() {
    searchLocationTextEditingController.dispose();
    super.dispose();
  }
}
