import 'package:customer/src/ui/utils/validators/auth_validator.dart';
import 'package:customer/src/ui/views/pages/auth/widgets/profile_textfield.dart';
import 'package:customer/src/ui/views/widgets/g_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_button.dart';
import 'package:stacked/stacked.dart';
import 'package:customer/src/ui/views/pages/profile/edit_profile_viewmodel.dart';

import '../../../utils/colors.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ViewModelBuilder<EditProfileViewModel>.reactive(
      viewModelBuilder: () => EditProfileViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: ThemeColors.background,
          appBar: AppBar(
            leading: CloseButton(),
            backgroundColor: ThemeColors.transparent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Profile Details",
                  style: TextStyle(
                    fontSize: width * 0.062,
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.fontColor,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Update your profile details',
                  style: TextStyle(
                    fontSize: width * 0.0425,
                    color: ThemeColors.fontColor,
                  ),
                ),
                SizedBox(height: 25),
                Form(
                  key: model.editProfileFormKey,
                  child: Column(
                    children: [
                      ProfileTextField(
                        icon: Icon(Icons.person_outline),
                        hintText: "Full Name",
                        controller: model.nameController,
                        validator: AuthValidator.fullNameValidator,
                      ),
                      ProfileTextField(
                        icon: Icon(Icons.email_outlined),
                        hintText: "Email",
                        controller: model.emailController,
                        validator: AuthValidator.emailValidator,
                      ),
                      ProfileTextField(
                        textColor: ThemeColors.fontColor,
                        icon: Icon(Icons.phone_android_outlined),
                        controller: model.mobileController,
                        enabled: false,
                      ),
                      ProfileTextField(
                        icon: Icon(Icons.location_on_outlined),
                        hintText: "Address",
                        controller: model.addressController,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                // model.isBusy
                //     ? GCircularProgressIndicator()
                //     : Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         mainAxisSize: MainAxisSize.max,
                //         // crossAxisAlignment: CrossAxisAlignment.end,
                //         children: [
                //           Flexible(
                //             flex: 7,
                //             child: GRoundedButton(
                //               onPressed: model.performEditProfile,
                //               color: ThemeColors.primary,
                //               text: "Save Profile",
                //             ),
                //           ),
                //           SizedBox(width: 20),
                //           Flexible(
                //             flex: 3,
                //             child: GRoundedButton(
                //               onPressed: () => () {},
                //               color: ThemeColors.primary,
                //               text: "Skip",
                //             ),
                //           ),
                //         ],
                //       ),
              ],
            ),
          ),
          bottomNavigationBar: model.isBusy
              ? GCircularProgressIndicator() : BottomAppBar(
            elevation: 10,
            child: Container(
              margin: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,

                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    flex: 7,
                    child: GRoundedButton(
                      onPressed: model.performEditProfile,
                      color: ThemeColors.primary,
                      text: "Save Profile",
                    ),
                  ),
                  SizedBox(width: 20),
                  Flexible(
                    flex: 3,
                    child: GRoundedButton(
                      onPressed: () => () {},
                      color: ThemeColors.primary,
                      text: "Skip",
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
