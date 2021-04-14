import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/src/app/helper.dart';
import 'package:customer/src/core/errors/failure.dart';
import 'package:customer/src/core/services/base_service.dart';
import 'package:logger/logger.dart';

class FirestoreService extends BaseService {
  @override
  Logger logger = getLogger("FirestoreService");

  static FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;

  Future<void> addData(String collectionPath, Map<String, dynamic> data) {
    return _tryFutureOrThrowFailure<void>(() async {
      final collectionRef = _firebaseFireStore.collection(collectionPath);
      logger.i("[addData - $collectionPath, $data]: Adding Data...");
      await collectionRef.add(data).timeout(
            Duration(seconds: 15),
            onTimeout: () => throw Failure(message: "Retry, timeout exceeded!"),
          );
    });
  }

  Future<void> setData(String path, Map<String, dynamic> data) {
    return _tryFutureOrThrowFailure<void>(() async {
      final docRef = _firebaseFireStore.doc(path);
      logger.i("[setData - $path, $data]: setting Data...");
      await docRef.set(data).timeout(
            Duration(seconds: 15),
            onTimeout: () => throw Failure(message: "Retry, timeout exceeded!"),
          );
    });
  }

  Future<void> updateData(String path, Map<String, dynamic> data) {
    return _tryFutureOrThrowFailure<void>(() async {
      final docRef = _firebaseFireStore.doc(path);
      logger.i("[updateData - $path, $data]: Updating Data...");
      await docRef.update(data).timeout(
            Duration(seconds: 15),
            onTimeout: () => throw Failure(message: "Retry, timeout exceeded!"),
          );
    });
  }

  Future<T> getDocument<T>(
      String path, T builder(DocumentSnapshot snapshot)) async {
    return _tryFutureOrThrowFailure<T>(() async {
      final docRef = _firebaseFireStore.doc(path);
      final snapshot = await docRef.get();
      return builder(snapshot);
    });
  }

  Future<T> _tryFutureOrThrowFailure<T>(
      Future<T> Function() methodToTry) async {
    try {
      return await methodToTry();
    } on FirebaseException catch (e) {
      logger.e("A firebase exception has occurred: $e");
      throw Failure(message: e.message);
    } on FormatException catch (e) {
      logger.e("A FormatException has occurred: $e");
      throw Failure(message: "Internal error occurred, please try again later!");
    }
  }
}
