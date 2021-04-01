import 'package:customer/src/app/locator.dart';
import 'package:customer/src/core/models/user_profile.dart';
import 'package:customer/src/core/services/authentication_service.dart';
import 'package:customer/src/core/services/user_profile_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EditProfileViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final UserProfileService _userProfileService = locator<UserProfileService>();
  final GlobalKey<FormState> editProfileFormKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  UserProfile _userProfile;

  void initialise() async {
    if (!_authenticationService.isUserLoggedIn) return;
    _userProfile = await _authenticationService.currentUserProfile;
    nameController.text = _userProfile.fullName ?? "";
    emailController.text = _userProfile.email ?? "";
    mobileController.text = _userProfile.phoneNumber != null
        ? "${_userProfile.phoneNumber.countryCode} - ${_userProfile.phoneNumber.number}"
        : "";
  }

  void performEditProfile() async {
    // print(_userProfile);
    if (!editProfileFormKey.currentState.validate()) return;
    setBusy(true);
    UserProfile updatedUserProfile = UserProfile(
      uid: _userProfile.uid,
      email: emailController.text,
      fullName: nameController.text,
      phoneNumber: _userProfile.phoneNumber,
    );
    await _userProfileService.updateUserProfile(updatedUserProfile);
    setBusy(false);
    print("Redirecting to location page.");

  }
}
