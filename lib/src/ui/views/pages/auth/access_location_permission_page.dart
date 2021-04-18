import 'package:customer/src/ui/utils/theme_colors.dart';
import 'package:customer/src/ui/views/pages/auth/access_location_permission_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:customer/src/app/router.gr.dart';
import 'package:customer/src/ui/views/widgets/gets_common_widgets.dart';

class AccessLocationPermissionPage extends StatefulWidget {
  @override
  _AccessLocationPermissionPageState createState() =>
      _AccessLocationPermissionPageState();
}

class _AccessLocationPermissionPageState
    extends State<AccessLocationPermissionPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccessLocationPermissionViewModel>.nonReactive(
      viewModelBuilder: () => AccessLocationPermissionViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GBackButton(),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location access \nis recommended",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "It would allow us to serve you better and \nshow you stores and services closest to \nwhere you are.",
                        style: TextStyle(fontSize: 16),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: GRoundedButton(
                            onPressed: model.askLocationPermission,
                            color: ThemeColors.primary,
                            text: "Allow Access",
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GRoundedButton(
                        onPressed: (){},
                        color: ThemeColors.white,
                        borderColor: ThemeColors.body,
                        text: "Enter Manually",
                        textStyle: TextStyle(
                            color: ThemeColors.body, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
