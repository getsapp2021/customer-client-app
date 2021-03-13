import 'package:customer/src/ui/utils/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: TextStyle(color: ThemeColors.white),
        ),
      ),
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
