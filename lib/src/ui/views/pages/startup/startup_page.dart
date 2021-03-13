import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:customer/src/ui/views/pages/startup/splash_page.dart';
import 'package:customer/src/ui/views/pages/startup/startup_viewmodel.dart';

class StartupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      viewModelBuilder: () => StartupViewModel(),
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) => SplashPage(),
    );
  }
}
