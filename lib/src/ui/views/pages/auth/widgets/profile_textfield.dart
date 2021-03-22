import 'package:flutter/material.dart';
import 'package:customer/src/ui/utils/colors.dart';

class ProfileTextField extends StatelessWidget {
  final Icon icon;
  final String hintText;
  final TextEditingController textEditingController;

  const ProfileTextField(
      {Key key, this.icon, this.hintText, this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height*0.065,
      padding: EdgeInsets.symmetric(horizontal: width / 20.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.06),
            blurRadius: 10.0,
            offset: Offset(2, 3),
          ),
        ],
        color: ThemeColors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.only(top: 0),
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: const BorderSide(
              color: ThemeColors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            borderSide: BorderSide(color: ThemeColors.white),
          ),
        ),
      ),
    );
  }
}
