import 'package:customer/src/ui/utils/validators/auth_validator.dart';
import 'package:customer/src/ui/views/widgets/g_circular_progress_indicator.dart';
import 'package:customer/src/ui/views/widgets/gets_common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:customer/src/ui/utils/theme_colors.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_button.dart';
import 'package:stacked/stacked.dart';
import 'package:customer/src/ui/views/pages/profile/edit_profile_viewmodel.dart';

class EditProfilePage extends StatelessWidget {
  final EditProfileViewModel _editProfileViewModel = EditProfileViewModel();
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return UnFocusWrapper(
      child: Scaffold(
        backgroundColor: ThemeColors.grey,
          appBar: AppBar(
            leading: CloseButton(),
            backgroundColor: ThemeColors.transparent,
            elevation: 0,
          ),
          body: ViewModelBuilder<EditProfileViewModel>.nonReactive(
            viewModelBuilder: () => _editProfileViewModel,
            onModelReady: (model) => model.initialise(),
            builder: (context, model, child) {
              return SingleChildScrollView(
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
                        color: ThemeColors.body,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Update your profile details',
                      style: TextStyle(
                        fontSize: width * 0.0425,
                        color: ThemeColors.body,
                      ),
                    ),
                    SizedBox(height: 25),
                    Form(
                      key: model.editProfileFormKey,
                      child: Column(
                        children: [
                          GTextFormField(
                            prefixIcon: Icon(Icons.person_outline),
                            hintText: "Full Name",
                            controller: model.nameController,
                            validator: AuthValidator.fullNameValidator,
                          ),
                          GTextFormField(
                            prefixIcon: Icon(Icons.email_outlined),
                            hintText: "Email",
                            controller: model.emailController,
                            validator: AuthValidator.emailValidator,
                          ),
                          GTextFormField(
                            textColor: ThemeColors.body,
                            prefixIcon: Icon(Icons.phone_android_outlined),
                            controller: model.mobileController,
                            enabled: false,
                            hintText: "98989 89898",
                          ),
                          GTextFormField(
                            prefixIcon: Icon(Icons.location_on_outlined),
                            hintText: "Address",
                            controller: model.addressController,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    model.isBusy
                        ? GCircularProgressIndicator()
                        : Row(
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
                                  onPressed: model.performSkip,
                                  color: ThemeColors.primary,
                                  text: "Skip",
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              );
            },
          )
          //   bottomNavigationBar: model.isBusy
          //       ? GCircularProgressIndicator()
          //       : BottomAppBar(
          //           elevation: 10,
          //           child: Container(
          //             margin: EdgeInsets.all(20),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               mainAxisSize: MainAxisSize.max,
          //
          //               // crossAxisAlignment: CrossAxisAlignment.end,
          //               children: [
          //                 Flexible(
          //                   flex: 7,
          //                   child: GRoundedButton(
          //                     onPressed: model.performEditProfile,
          //                     color: ThemeColors.primary,
          //                     text: "Save Profile",
          //                   ),
          //                 ),
          //                 SizedBox(width: 20),
          //                 Flexible(
          //                   flex: 3,
          //                   child: GRoundedButton(
          //                     onPressed: () => () {},
          //                     color: ThemeColors.primary,
          //                     text: "Skip",
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          ),
    );
  }
}
