import 'package:customer/src/app/helper.dart';
import 'package:customer/src/core/errors/failure.dart';
import 'package:customer/src/core/models/location.dart';
import 'package:customer/src/core/services/base_service.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:customer/src/core/models/suggestion.dart';
import 'package:customer/src/core/models/place.dart';
import 'package:logger/src/logger.dart';
import 'package:uuid/uuid.dart';
import 'package:geocoder/geocoder.dart';
import 'package:customer/src/core/models/secret.dart';
import 'package:customer/src/core/utils/constants/api_paths.dart';

abstract class LocationServiceBase {}

class LocationService implements BaseService {
  @override
  Logger logger = getLogger("LocationService");

  String _sessionToken;

  final Dio dio = new Dio();

  Future<List<PlaceSuggestion>> fetchSuggestions(String input,
      [Location currentLocation]) async {
    if (input.isEmpty || input.length < 3) return [];

    logger.i("[fetchSuggestions]: fetching location suggestions for: $input");

    final String apiKey = secrets.googleMapApiKey;
    final String reqPath = ApiPaths.googlePlaceAutocomplete;

    final Map<String, dynamic> queryParameters = {
      "input": input,
      "key": apiKey,
      "sessiontoken": _sessionToken,
      "language": "en",
      "components": "country:in",
      "types": "address"
    };
    if (currentLocation != null)
      queryParameters['origin'] =
          "${currentLocation.latitude},${currentLocation.longitude}";
    try{
      final response = await dio.get(reqPath, queryParameters: queryParameters);

      // List<Suggestion> fakeData = List.generate(
      //     100, (index) => Suggestion("placeId: $index", "description $index"));
      // await Future.delayed(Duration(seconds: 3));
      // return fakeData;

      if (response.statusCode == 200) {
        final result = response.data;
        if (result['status'] == 'OK') {
          return result['predictions']
              .map<PlaceSuggestion>(
                  (prediction) => PlaceSuggestion.fromMap(prediction))
              .toList();
        }

        if (result['status'] == 'ZERO_RESULTS') {
          return [];
        }
        throw Failure(message: "Failed to fetch suggestion, Internal issue occurred, please try again later.", error: result['error_message']);
      } else {
        throw Failure(message: 'Failed to fetch suggestion.');
      }
    } on Failure catch(e, s){
      logger.e("Failure caught: ${e.message}", e.error ?? e.message, s);
      rethrow;
    }
  //  TODO: handle error for network error
  //  TODO: handle error for wrong APIs
  }

  Future<Place> getPlaceDetailsFromId(String placeId) async {
    final Secrets secret = await loadSecrets();
    final String apiKey = secret.googleMapApiKey;
    // final request =
    //     'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=address_component,geometry&key=$apiKey&sessiontoken=$_sessionToken';
    // final response = await client.get(request);

    // print(response.body);
    // if (response.statusCode == 200) {
    //   final result = json.decode(response.body);
    //   if (result['status'] == 'OK') {
    //     print(result);
    //     final components =
    //         result['result']['address_components'] as List<dynamic>;
    //     // build result
    //     final place = Place();
    //     components.forEach((c) {
    //       final List type = c['types'];
    //
    //       if (type.contains('street_number')) {
    //         place.streetNumber = c['long_name'];
    //       }
    //       if (type.contains('route')) {
    //         place.street = c['long_name'];
    //       }
    //       if (type.contains('locality')) {
    //         place.city = c['long_name'];
    //       }
    //       if (type.contains('postal_code')) {
    //         place.zipCode = c['long_name'];
    //       }
    //     });
    //     final Map<String, dynamic> geometry =
    //         result['result']['geometry']['location'];
    //     place.lat = geometry['lat'];
    //     place.long = geometry['lng'];
    //     return place;
    //   }
    //
    //   throw Exception(result['error_message']);
    // } else {
    //   throw Exception('Failed to fetch suggestion');
    // }
  }

  Future<List<Address>> getAddressFromCoordinates(Coordinates pos) async {
    List<Address> address =
        await Geocoder.local.findAddressesFromCoordinates(pos);

    return address;
  }

  void createNewSession() {
    _sessionToken = new Uuid().v4();
    logger.i("Creating new session for places API: $_sessionToken");
  }

  //TODO: return custom Location model instead of Position
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
