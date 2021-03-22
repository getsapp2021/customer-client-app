import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class UserProfile {
  String uid;
  String fullName;
  String email;
  String phone;
  String avatarUrl;

  UserProfile({
    @required this.uid,
    this.fullName,
    this.email,
    @required this.phone,
    this.avatarUrl,
  });

  // Firebase Firestore document snapshot to UserProfile
  factory UserProfile.fromSnapshot(DocumentSnapshot snapshot) {
    if (snapshot == null) return null;
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
      phone: map['phone'] as String,
      avatarUrl: map['avatarUrl'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullName': this.fullName,
      'email': this.email,
      'phone': this.phone,
      'avatarUrl': this.avatarUrl,
    };
  }
}
