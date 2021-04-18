class Secrets {
  final String googleMapApiKey;

  Secrets({this.googleMapApiKey = ""});

  factory Secrets.fromJson(Map<String, dynamic> jsonMap) {
    print(jsonMap["google_maps_api_key"]);
    return Secrets(googleMapApiKey: jsonMap["google_maps_api_key"]);
  }
}
