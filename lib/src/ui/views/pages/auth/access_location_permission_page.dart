import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/ui/views/pages/auth/access_location_permission_viewmodel.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';
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
    return ViewModelBuilder<AccessLocationPermissionViewModel>.reactive(
        viewModelBuilder: () => AccessLocationPermissionViewModel(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                leading: Icon(Icons.keyboard_arrow_left),
                backgroundColor: ThemeColors.transparent,
                elevation: 0,
              ),
              body: Container(
                width: context.mq.size.width,
                height: context.mq.size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Location access \nis recommended".text.xl2.bold.make(),
                    SizedBox(height: 20),
                    "It would allow us to serve you better and \nshow you stores and services closest to \nwhere you are."
                        .text
                        .make(),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: GRoundedButton(
                          onPressed: () => model.askPermission(),
                          color: ThemeColors.primary,
                          text: "Allow Access",
                          textColor: ThemeColors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GRoundedButton( 
                      onPressed: () =>
                          model.navigateTo(Routes.searchLocationPage),
                      color: ThemeColors.white,
                      borderColor: ThemeColors.black,
                      text: "Enter Manually",
                      textColor: ThemeColors.black,
                    ),
                    SizedBox(height: 20),
                  ],
                ).px32(),
              ),
            ));
  }
}
