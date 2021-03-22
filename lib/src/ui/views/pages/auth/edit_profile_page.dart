import 'package:customer/src/ui/views/pages/auth/widgets/profile_textfield.dart';
import 'package:flutter/material.dart';
import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_button.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ThemeColors.background,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            //put navigator
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: ThemeColors.primaryLight,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Text(
                "Profile Details",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Update your profile details',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
            ProfileTextField(
              icon: Icon(Icons.person_outline),
              hintText: "Full Name",
              textEditingController: nameController,
            ),
            ProfileTextField(
              icon: Icon(Icons.email_outlined),
              hintText: "Email",
              textEditingController: emailController,
            ),
            ProfileTextField(
              icon: Icon(Icons.phone_android_outlined),
              hintText: "+91 9824343803",
              textEditingController: mobileController,
            ),
            ProfileTextField(
              icon: Icon(Icons.location_on_outlined),
              hintText: "Address",
              textEditingController: addressController,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              flex: 7,
              child: GRoundedButton(
                onPressed: () => () {},
                color: ThemeColors.primary,
                text: "Save Profile",
              ),
            ),
            SizedBox(
              width: 20,
            ),
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
    );
  }
}
