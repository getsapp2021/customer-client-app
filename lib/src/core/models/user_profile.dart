import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/src/core/models/phone_number.dart';
import 'package:flutter/foundation.dart';

class UserProfile {
  final String uid;
  final String fullName;
  final String email;
  final PhoneNumber phoneNumber;
  final String avatarUrl;

  UserProfile({
    @required this.uid,
    @required this.phoneNumber,
    this.fullName = "",
    this.email = "",
    this.avatarUrl = "",
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
