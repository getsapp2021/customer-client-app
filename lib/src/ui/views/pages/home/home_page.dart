import 'package:customer/src/app/locator.dart';
import 'package:customer/src/core/services/authentication_service.dart';
import 'package:customer/src/ui/utils/theme_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page: ",
          style: TextStyle(color: ThemeColors.white),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => _authenticationService.signOut())
        ],
      ),
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
