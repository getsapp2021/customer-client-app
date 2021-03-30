class Place {
  String streetNumber;
  String street;
  String city;
  String zipCode;
  double lat;
  double long;

  Place(
      {this.streetNumber,
      this.street,
      this.city,
      this.zipCode,
      this.lat,
      this.long});

  @override
  String toString() {
    return 'Place(streetNumber: $streetNumber, street: $street, city: $city, zipCode: $zipCode, lat: $lat, long: $long)';
  }
}
