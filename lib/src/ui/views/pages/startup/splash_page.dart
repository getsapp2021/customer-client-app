import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/app/gets_extensions.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/startup/brand_name_white.png",
              width: context.mq.size.width * 0.8,
            ),
            CircularProgressIndicator(
              backgroundColor: ThemeColors.primary,
              valueColor: AlwaysStoppedAnimation<Color>(ThemeColors.white),
            )
          ],
        ),
      ),
    );
  }
}
