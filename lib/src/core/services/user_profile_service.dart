import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer/src/app/locator.dart';
import 'package:customer/src/core/errors/failure.dart';
import 'package:customer/src/core/models/user_profile.dart';
import 'package:customer/src/core/services/firestore_service.dart';
import 'package:customer/src/core/utils/constants/firebase/firebase_storage_buckets.dart';
import 'package:customer/src/core/utils/constants/firebase/firestore_collections.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserProfileService {
  // Firebase instances
  static FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  FirestoreService _firestoreService = locator<FirestoreService>();

  final _userProfileAvatarBucket =
      _firebaseStorage.ref(FirebaseStorageBuckets.userProfileAvatars);

  String _getUserProfileDocumentPath(String uid) =>
      "${FireStoreCollections.userProfiles}/$uid";

  Future<UserProfile> getUserProfile(String uid) =>
      _firestoreService.getDocument(
        _getUserProfileDocumentPath(uid),
        (snapshot) => UserProfile.fromSnapshot(snapshot),
      );

  Future<void> createUserProfile(UserProfile userProfile) =>
      _firestoreService.setData(
          _getUserProfileDocumentPath(userProfile.uid), userProfile.toMap());

  Future<void> updateUserProfile(UserProfile userProfile) {
    return _firestoreService.updateData(
        _getUserProfileDocumentPath(userProfile.uid), userProfile.toMap());
  }

  // TODO: verification remaining from this line
  Future<String> uploadAvatarImageAndGetDownloadableUrl(
      File image, String imageName) async {
    final imageReference = _userProfileAvatarBucket.child(imageName);
    try {
      await imageReference.putFile(image);
      return imageReference.getDownloadURL();
    } on FirebaseException catch (e) {
      print("A firebase exception has occured: $e");
      throw Failure(message: e.message);
    }
  }

  Future<void> updateAvatarImageInUserProfile(String uid, String url) =>
      _firestoreService.updateData(
        FireStoreCollections.userProfiles,
        {'avatarUrl': url},
      );

  Future<void> deleteAvatarImage(String imageUrl) async {
    // TODO: check for required error handling
    Reference photoRef = _firebaseStorage.refFromURL(imageUrl);
    await photoRef.delete();
  }
}
