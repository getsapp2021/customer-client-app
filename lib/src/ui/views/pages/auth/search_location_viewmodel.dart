import 'package:customer/src/app/router.gr.dart';
import 'package:customer/src/core/models/place.dart';
import 'package:customer/src/core/models/suggestion.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoder/geocoder.dart';
import 'package:stacked/stacked.dart';
import 'package:customer/src/core/services/location_service.dart';
import 'package:customer/src/app/locator.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchLocationViewModel extends BaseViewModel {
  LocationService _locationService = locator<LocationService>();
  NavigationService _navigationService = locator<NavigationService>();

  TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  String input = "";

  Future<List<Suggestion>> fetchSuggestions() =>
      _locationService.fetchSuggestions(input);

  void navigateTo(String routeName) {
    _navigationService.navigateTo(routeName);
  }

  void createNewSession() => _locationService.createNewSession();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<Coordinates> placeDetailFromId(String placeId) async {
    Place _place = await _locationService.getPlaceDetailFromId(placeId);
    return Coordinates(_place.lat, _place.long);
    // return Coordinates(22.305460, 73.131978);
  }

  void navigateToResultPage(String placeId) async {
    Coordinates coordinate = await placeDetailFromId(placeId);
    _navigationService.navigateTo(Routes.searchLocationResultDetailPage,
        arguments:
            SearchLocationResultDetailPageArguments(coordinate: coordinate));
  }
}
