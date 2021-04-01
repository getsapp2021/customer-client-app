import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/src/core/errors/failure.dart';
import 'package:customer/src/core/services/base_service.dart';

class FirestoreService extends BaseService {
  static FirebaseFirestore _firebaseFireStore = FirebaseFirestore.instance;

  Future<void> setData(String path, Map<String, dynamic> data) {
    return _tryFutureOrThrowFailure<void>(() async {
      final docRef = _firebaseFireStore.doc(path);
      logger.i("$path : $data");
      await docRef.set(data).timeout(
            Duration(seconds: 15),
            onTimeout: () => throw Failure(message: "Retry, timeout exceeded!"),
          );
    });
  }

  Future<void> updateData(String path, Map<String, dynamic> data) {
    return _tryFutureOrThrowFailure<void>(() async {
      final docRef = _firebaseFireStore.doc(path);
      logger.i("$path : $data");
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
      logger.e("A firebase exception has occured: $e");
      throw Failure(message: e.message);
    } on FormatException catch (e) {
      logger.e("A FormatException has occured: $e");
      throw Failure(message: "Internal error occured, please try again later!");
    }
  }
}
