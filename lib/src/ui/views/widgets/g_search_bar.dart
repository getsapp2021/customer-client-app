import 'package:customer/src/ui/utils/theme_colors.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_button.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_textfield.dart';
import 'package:flutter/material.dart';

class GSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 8, 10),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Flexible(
              flex: 1,
              child: Icon(Icons.keyboard_arrow_left, color: ThemeColors.white,)),
          Flexible(
            flex: 3,
            child: GRoundedTextField(
              hintText: "  Search Something",
              fillColor: ThemeColors.white,
            ),
          )
        ]),
      ),
    );
  }
}
