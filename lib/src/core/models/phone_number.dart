import 'package:flutter/foundation.dart';

class PhoneNumber {
  final String countryISOCode;
  final String countryCode;
  final String number;

  PhoneNumber({
    @required this.countryISOCode,
    @required this.countryCode,
    @required this.number,
  });

  String get completeNumber {
    return countryCode + number;
  }

  factory PhoneNumber.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return PhoneNumber(
      countryCode: map['countryCode'] as String,
      number: map['number'] as String,
      countryISOCode: map['countryISOCode'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'countryCode': this.countryCode,
      'number': this.number,
      'countryISOCode': this.countryISOCode
    };
  }

  @override
  String toString() {
    return 'PhoneNumber{countryISOCode: $countryISOCode, countryCode: $countryCode, number: $number}';
  }
}
