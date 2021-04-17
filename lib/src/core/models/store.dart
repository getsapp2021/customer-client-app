import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:customer/src/core/models/location.dart';

enum StoreType { store, service }
enum StoreStatus { open, closed }
enum StoreAction { dineIn, takeAway, homeDelivery }
enum BookedServiceStatus { ongoing, completed, cancelled }

class Store {
  String id;
  String title;
  String description;
  String storeCategory;
  String phoneNumber;
  Location location;
  double storeReviews;
  StoreStatus storeStatus;
  StoreAction storeAction;
  List<StoreProduct> storeProducts;
  StoreType storeType;
  DateTime createdAt;
  DateTime updatedAt;
  Store({
    this.id,
    this.title,
    this.description,
    this.storeCategory,
    this.phoneNumber,
    this.location,
    this.storeReviews,
    this.storeStatus,
    this.storeAction,
    this.storeProducts,
    this.storeType,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      ' StoreCategory': storeCategory,
      'phoneNumber': phoneNumber,
      'location': location.toMap(),
      'storeReviews': storeReviews,
      ' StoreStatus': storeStatus.toString(),
      ' StoreAction': storeAction.toString(),
      'storeProducts': storeProducts?.map((x) => x.toMap())?.toList(),
      'storeType': storeType.toString(),
    };
  }

  factory Store.fromMap(Map<String, dynamic> map) {
    return Store(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      storeCategory: map[' StoreCategory'],
      phoneNumber: map['phoneNumber'],
      location: Location.fromMap(map['location']),
      storeReviews: map['storeReviews'],
      storeStatus: map[' StoreStatus'],
      storeAction: map[' StoreAction'],
      storeType: map['storeType'],
      createdAt: map['createdAt'] == null
          ? null
          : DateTime.parse(map['createdAt'] as String),
      updatedAt: map['updatedAt'] == null
          ? null
          : DateTime.parse(map['updatedAt'] as String),
      storeProducts: List<StoreProduct>.from(
          map['storeProducts']?.map((x) => StoreProduct.fromMap(x))),
    );
  }
}

class StoreProduct {
  String id;
  String title;
  String description;
  String productType;
  double productReviewsAverage;
  double productPrice;
  double discountedPrice;
  DateTime createdAt;
  DateTime updatedAt;
  List<ProductOption> productOptions;
  StoreProduct({
    this.id,
    this.title,
    this.description,
    this.productType,
    this.productReviewsAverage,
    this.productPrice,
    this.discountedPrice,
    this.productOptions,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'productType': productType,
      'productReviewsAverage': productReviewsAverage,
      'productPrice': productPrice,
      'discountedPrice': discountedPrice,
      'productOptions': productOptions?.map((x) => x.toMap())?.toList(),
    };
  }

  factory StoreProduct.fromMap(Map<String, dynamic> map) {
    return StoreProduct(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      productType: map['productType'],
      productReviewsAverage: map['productReviewsAverage'],
      productPrice: map['productPrice'],
      discountedPrice: map['discountedPrice'],
      createdAt: map['createdAt'] == null
          ? null
          : DateTime.parse(map['createdAt'] as String),
      updatedAt: map['updatedAt'] == null
          ? null
          : DateTime.parse(map['updatedAt'] as String),
      productOptions: List<ProductOption>.from(
          map['productOptions']?.map((x) => ProductOption.fromMap(x))),
    );
  }
}

class ProductOption {
  String optionName;
  String optionValue;
  ProductOption({
    this.optionName,
    this.optionValue,
  });

  Map<String, dynamic> toMap() {
    return {
      'optionName': optionName,
      'optionValue': optionValue,
    };
  }

  factory ProductOption.fromMap(Map<String, dynamic> map) {
    return ProductOption(
      optionName: map['optionName'],
      optionValue: map['optionValue'],
    );
  }
}

class ServiceBooking {
  String serviceId;
  DateTime appointmentSchedule;
  DateTime createdAt;
  DateTime updatedAt;
  StoreProduct serviceProduct;
  double bookedServicePrice;
  BookedServiceStatus bookedServiceStatus;
  ServiceBooking({
    this.serviceId,
    this.appointmentSchedule,
    this.createdAt,
    this.updatedAt,
    this.serviceProduct,
    this.bookedServicePrice,
    this.bookedServiceStatus,
  });

  Map<String, dynamic> toMap() {
    return {
      'serviceId': serviceId,
      'appointmentSchedule': appointmentSchedule.millisecondsSinceEpoch,
      'serviceProduct': serviceProduct.toMap(),
      'bookedServicePrice': bookedServicePrice,
      'bookedServiceStatus': bookedServiceStatus.toString(),
    };
  }

  factory ServiceBooking.fromMap(Map<String, dynamic> map) {
    return ServiceBooking(
      serviceId: map['serviceId'],
      appointmentSchedule:
          DateTime.fromMillisecondsSinceEpoch(map['appointmentSchedule']),
      createdAt: map['createdAt'] == null
          ? null
          : DateTime.parse(map['createdAt'] as String),
      updatedAt: map['updatedAt'] == null
          ? null
          : DateTime.parse(map['updatedAt'] as String),
      serviceProduct: StoreProduct.fromMap(map['serviceProduct']),
      bookedServicePrice: map['bookedServicePrice'],
      bookedServiceStatus: map['bookedServiceStatus'],
    );
  }
}

class ServiceBookingUser {}

class ServiceBookingStore {}
