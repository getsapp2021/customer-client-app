import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/src/core/models/phone_number.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserProfile {
  final String uid;
  final String fullName;
  final String email;
  final PhoneNumber phoneNumber;
  final String avatarUrl;
  final List<Address> addresses;

  UserProfile({
    @required this.uid,
    @required this.phoneNumber,
    this.fullName = "",
    this.email = "",
    this.avatarUrl = "",
    this.addresses,
  });

  // Firebase FireStore document snapshot to UserProfile
  factory UserProfile.fromSnapshot(DocumentSnapshot snapshot) {
    if (snapshot == null || snapshot.data() == null) return null;
    Map<String, dynamic> map = snapshot.data();
    map["uid"] = snapshot.id;
    return UserProfile.fromMap(map);
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return UserProfile(
      uid: map['uid'] as String,
      fullName: map['fullName'] as String,
      email: map['email'] as String,
      phoneNumber: PhoneNumber.fromMap(map['phoneNumber']),
      avatarUrl: map['avatarUrl'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullName': this.fullName,
      'email': this.email,
      'phoneNumber': this.phoneNumber.toMap(),
      'avatarUrl': this.avatarUrl,
    };
  }

  @override
  String toString() {
    return 'UserProfile{uid: $uid, fullName: $fullName, email: $email, phoneNumber: $phoneNumber, avatarUrl: $avatarUrl}';
  }
}

class Address {
  String id;

  /// location from map
  double latitude;
  double longitude;

  /// house/block/building number
  String houseNumber;

  /// landmark
  String completeAddress;

  /// Type can be [home, work, other]
  String type;

  Address({
    this.id,
    this.latitude,
    this.longitude,
    this.houseNumber,
    this.completeAddress,
    this.type,
  });

  /// from Firestore document snapshot
  factory Address.fromSnapshot(DocumentSnapshot snapshot) {
    if(snapshot == null) return null;
    return Address.fromMap(snapshot.data()..addAll({'id': snapshot.id}));
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return Address(
      id: map['id'],
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      houseNumber: map['houseNumber'],
      completeAddress: map['completeAddress'],
      type: map['type'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "latitude": latitude,
      "longitude": longitude,
      "houseNumber": houseNumber,
      "completeAddress": completeAddress,
      "type": type
    };
  }
}
