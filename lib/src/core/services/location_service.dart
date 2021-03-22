import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:customer/src/core/models/suggestion.dart';
import 'package:customer/src/core/models/place.dart';
import 'dart:convert';
import 'package:uuid/uuid.dart';
import 'package:geocoder/geocoder.dart';

class LocationService {
  final client = Client();

  LocationService();

  // static final String androidKey = 'AIzaSyAc1T_GRwqrpiA6kTTbbQROaj0_PG19IJ4';
  // static final String iosKey = 'AIzaSyCt4BaCg_bY3Mdxx2UV1ZJEY8OBO2uFUZM';
  // final apiKey = Platform.isAndroid ? androidKey : iosKey;
  final String apiKey = "AIzaSyB_evQGjqk01p1sYrCVlMTIujns7SsG9p8";
  Future<List<Suggestion>> fetchSuggestions(String input) async {
    String sessionToken = Uuid().v4();
    // final request =
    //     'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=address&language=en&components=country:in&key=$apiKey&sessiontoken=$sessionToken';
    // final response = await client.get(request);

    List<Suggestion> fakeData = List.generate(
        100, (index) => Suggestion("$index", "description $index"));
    await Future.delayed(Duration(seconds: 3));
    return fakeData;
    // if (response.statusCode == 200) {
    //   final result = json.decode(response.body);
    //   if (result['status'] == 'OK') {
    //     // compose suggestions in a list
    //     return result['predictions']
    //         .map<Suggestion>((p) => Suggestion(p['place_id'], p['description']))
    //         .toList();
    //   }
    //   if (result['status'] == 'ZERO_RESULTS') {
    //     return [];
    //   }
    //   throw Exception(result['error_message']);
    // } else {
    //   throw Exception('Failed to fetch suggestion');
    // }
  }

  Future<Place> getPlaceDetailFromId(
      String placeId, String sessionToken) async {
    final request =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=address_component&key=$apiKey&sessiontoken=$sessionToken';
    final response = await client.get(request);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        final components =
            result['result']['address_components'] as List<dynamic>;
        // build result
        final place = Place();
        components.forEach((c) {
          final List type = c['types'];
          if (type.contains('street_number')) {
            place.streetNumber = c['long_name'];
          }
          if (type.contains('route')) {
            place.street = c['long_name'];
          }
          if (type.contains('locality')) {
            place.city = c['long_name'];
          }
          if (type.contains('postal_code')) {
            place.zipCode = c['long_name'];
          }
        });
        return place;
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }

  Future<List<Address>> getAddressFromCoordinates(Coordinates pos) async {
    List<Address> address =
        await Geocoder.local.findAddressesFromCoordinates(pos);

    return address;
  }
}
