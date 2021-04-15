import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:customer/src/core/models/location.dart';

enum VendorCategory { electronics }
enum VendorType { store, service }
enum VendorStatus { open, closed }
enum VendorAction { dine_in, take_away, home_delivery }
enum ProductType { mobilePhone, laptop, desktop }
enum ServiceProductCategory { male, female }
enum BookedServiceStatus { ongoing, completed, cancelled }

class Vendor {
  String id;
  String title;
  String description;
  VendorCategory vendorCategory;
  String phoneNumber;
  Location location;
  double storeReviews;
  VendorStatus vendorStatus;
  VendorAction vendorAction;
  List<StoreProduct> storeProducts;
  Vendor({
    this.id,
    this.title,
    this.description,
    this.vendorCategory,
    this.phoneNumber,
    this.location,
    this.storeReviews,
    this.vendorStatus,
    this.vendorAction,
    this.storeProducts,
  });
  VendorType vendorType;

  Vendor copyWith({
    String id,
    String title,
    String description,
    VendorCategory vendorCategory,
    String phoneNumber,
    Location location,
    double storeReviews,
    VendorStatus vendorStatus,
    VendorAction vendorAction,
    List<StoreProduct> storeProducts,
  }) {
    return Vendor(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      vendorCategory: vendorCategory ?? this.vendorCategory,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      location: location ?? this.location,
      storeReviews: storeReviews ?? this.storeReviews,
      vendorStatus: vendorStatus ?? this.vendorStatus,
      vendorAction: vendorAction ?? this.vendorAction,
      storeProducts: storeProducts ?? this.storeProducts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'vendorCategory': vendorCategory,
      'phoneNumber': phoneNumber,
      'location': location.toMap(),
      'storeReviews': storeReviews,
      'vendorStatus': vendorStatus,
      'vendorAction': vendorAction,
      'storeProducts': storeProducts?.map((x) => x.toMap())?.toList(),
    };
  }

  factory Vendor.fromMap(Map<String, dynamic> map) {
    return Vendor(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      vendorCategory: map['vendorCategory'],
      phoneNumber: map['phoneNumber'],
      location: Location.fromMap(map['location']),
      storeReviews: map['storeReviews'],
      vendorStatus: map['vendorStatus'],
      vendorAction: map['vendorAction'],
      storeProducts: List<StoreProduct>.from(
          map['storeProducts']?.map((x) => StoreProduct.fromMap(x))),
    );
  }
}

class StoreProduct {
  String id;
  String title;
  String description;
  ProductType productType;
  double productReviews;
  double productPrice;
  ProductOptions productOptions;
  StoreProduct({
    this.id,
    this.title,
    this.description,
    this.productType,
    this.productReviews,
    this.productPrice,
    this.productOptions,
  });

  StoreProduct copyWith({
    String id,
    String title,
    String description,
    ProductType productType,
    double productReviews,
    double productPrice,
    ProductOptions productOptions,
  }) {
    return StoreProduct(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      productType: productType ?? this.productType,
      productReviews: productReviews ?? this.productReviews,
      productPrice: productPrice ?? this.productPrice,
      productOptions: productOptions ?? this.productOptions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'productType': productType.toString(),
      'productReviews': productReviews,
      'productPrice': productPrice,
      'productOptions': productOptions.toMap(),
    };
  }

  factory StoreProduct.fromMap(Map<String, dynamic> map) {
    return StoreProduct(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      productType: map['productType'],
      productReviews: map['productReviews'],
      productPrice: map['productPrice'],
      productOptions: ProductOptions.fromMap(map['productOptions']),
    );
  }
}

class ProductOptions {
  String colorCode;
  int capacity;
  int stockCount;
  ProductOptions({
    this.colorCode,
    this.capacity,
    this.stockCount,
  });

  ProductOptions copyWith({
    String colorCode,
    int capacity,
    int stockCount,
  }) {
    return ProductOptions(
      colorCode: colorCode ?? this.colorCode,
      capacity: capacity ?? this.capacity,
      stockCount: stockCount ?? this.stockCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'colorCode': colorCode,
      'capacity': capacity,
      'stockCount': stockCount,
    };
  }

  factory ProductOptions.fromMap(Map<String, dynamic> map) {
    return ProductOptions(
      colorCode: map['colorCode'],
      capacity: map['capacity'],
      stockCount: map['stockCount'],
    );
  }
}

class ServiceProduct {
  String id;
  String title;
  double serviceProductReviews;
  double serviceProductPrice;
  ServiceProductCategory serviceProductCategory;
  ServiceProduct({
    this.id,
    this.title,
    this.serviceProductReviews,
    this.serviceProductPrice,
    this.serviceProductCategory,
  });

  ServiceProduct copyWith({
    String id,
    String title,
    double serviceProductReviews,
    double serviceProductPrice,
    ServiceProductCategory serviceProductCategory,
  }) {
    return ServiceProduct(
      id: id ?? this.id,
      title: title ?? this.title,
      serviceProductReviews:
          serviceProductReviews ?? this.serviceProductReviews,
      serviceProductPrice: serviceProductPrice ?? this.serviceProductPrice,
      serviceProductCategory:
          serviceProductCategory ?? this.serviceProductCategory,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'serviceProductReviews': serviceProductReviews,
      'serviceProductPrice': serviceProductPrice,
      'serviceProductCategory': serviceProductCategory,
    };
  }

  factory ServiceProduct.fromMap(Map<String, dynamic> map) {
    return ServiceProduct(
      id: map['id'],
      title: map['title'],
      serviceProductReviews: map['serviceProductReviews'],
      serviceProductPrice: map['serviceProductPrice'],
      serviceProductCategory: map['serviceProductCategory'],
    );
  }
}

class BookService {
  String serviceId;
  DateTime dateTime;
  ServiceProduct serviceProduct;
  double bookedServicePrice;
  BookedServiceStatus bookedServiceStatus;
  BookService({
    this.serviceId,
    this.dateTime,
    this.serviceProduct,
    this.bookedServicePrice,
    this.bookedServiceStatus,
  });

  BookService copyWith({
    String serviceId,
    DateTime dateTime,
    ServiceProduct serviceProduct,
    double bookedServicePrice,
    BookedServiceStatus bookedServiceStatus,
  }) {
    return BookService(
      serviceId: serviceId ?? this.serviceId,
      dateTime: dateTime ?? this.dateTime,
      serviceProduct: serviceProduct ?? this.serviceProduct,
      bookedServicePrice: bookedServicePrice ?? this.bookedServicePrice,
      bookedServiceStatus: bookedServiceStatus ?? this.bookedServiceStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'serviceId': serviceId,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'serviceProduct': serviceProduct.toMap(),
      'bookedServicePrice': bookedServicePrice,
      'bookedServiceStatus': bookedServiceStatus.toString(),
    };
  }

  factory BookService.fromMap(Map<String, dynamic> map) {
    return BookService(
      serviceId: map['serviceId'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
      serviceProduct: ServiceProduct.fromMap(map['serviceProduct']),
      bookedServicePrice: map['bookedServicePrice'],
      bookedServiceStatus: map['bookedServiceStatus'],
    );
  }
}
