class PlaceSuggestion {
  final String placeId;
  final String description;
  final int distanceFromCurrentLocationInMeter;
  final String mainText;
  final String secondaryText;

  double get distanceFromCurrentLocationInKiloMeter => distanceFromCurrentLocationInMeter == null ? null :
      double.parse((distanceFromCurrentLocationInMeter / 1000).toStringAsFixed(1));

  bool get hasDistance => distanceFromCurrentLocationInKiloMeter != null;
  PlaceSuggestion({
    this.placeId,
    this.description,
    this.distanceFromCurrentLocationInMeter,
    this.mainText,
    this.secondaryText,
  });

  factory PlaceSuggestion.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PlaceSuggestion(
      placeId: map["place_id"],
      description: map["description"],
      distanceFromCurrentLocationInMeter:
          map["distance_meters"] != null ? map["distance_meters"] as int : null,
      mainText: map["structured_formatting"] != null &&
              map["structured_formatting"]["main_text"] != null
          ? map["structured_formatting"]["main_text"]
          : map["description"],
      secondaryText: map["structured_formatting"] != null &&
              map["structured_formatting"]["secondary_text"] != null
          ? map["structured_formatting"]["secondary_text"]
          : "",
    );
  }

  @override
  String toString() {
    return 'Suggestion(description: $description, placeId: $placeId)';
  }
}
