import 'package:customer/src/core/models/suggestion.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:customer/src/core/services/location_service.dart';
import 'package:customer/src/app/locator.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchLocationViewModel extends FutureViewModel<List<Suggestion>> {
  LocationService _locationService = locator<LocationService>();
  NavigationService _navigationService = locator<NavigationService>();
  List<Suggestion> suggestions;

  TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String input = "";

  @override
  Future<List<Suggestion>> futureToRun() =>
      _locationService.fetchSuggestions(input);

  void setSearchText(String value) {
    _searchController.text = "bye";
    notifyListeners();
  }

  void navigateTo(String routeName) {
    _navigationService.navigateTo(routeName);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
