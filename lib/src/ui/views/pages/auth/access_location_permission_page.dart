import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/ui/views/pages/auth/access_location_permission_viewmodel.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:customer/src/app/router.gr.dart';

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
              appBar: AppBar(
                leading: Icon(Icons.keyboard_arrow_left),
                backgroundColor: ThemeColors.transparent,
                elevation: 0,
              ),
              body: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location access \nis recommended",
                        style: TextStyle(fontSize: 20),
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
                            onPressed: () => model.askPermission(),
                            color: ThemeColors.primary,
                            child: Text(
                              "Allow Access",
                              style: TextStyle(
                                color: ThemeColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GRoundedButton(
                        onPressed: () =>
                            model.navigateTo(Routes.searchLocationPage),
                        color: ThemeColors.white,
                        borderColor: ThemeColors.black,
                        child: Text(
                          "Enter Manually",
                          style: TextStyle(color: ThemeColors.black),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ));
  }
}
