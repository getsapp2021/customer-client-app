import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_button.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_textfield.dart';
import 'package:geocoder/geocoder.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:customer/src/ui/views/pages/auth/search_location_result_detail_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:customer/src/app/router.gr.dart';

class SearchLocationResultDetailPage extends StatefulWidget {
  @override
  _SearchLocationResultDetailPageState createState() =>
      _SearchLocationResultDetailPageState();
}

class _SearchLocationResultDetailPageState
    extends State<SearchLocationResultDetailPage> {
  // GoogleMapController mapController;

  final Set<Marker> markers = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
    Coordinates coordinate;
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => SearchLocationResultDetailViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: ThemeColors.white,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 0.5 * context.screenHeight,
                      child: GoogleMap(
                        onMapCreated: model.onMapCreated,
                        markers: Set.from(markers),
                        initialCameraPosition: CameraPosition(
                          target: LatLng(22.3072, 73.1812),
                          zoom: 11.0,
                        ),
                        onTap: (pos) {
                          print("Position: $pos");
                          coordinate = Coordinates(pos.latitude, pos.longitude);
                          Marker tmp = Marker(
                            markerId: MarkerId("$index"),
                            position: pos,
                            draggable: true,
                            onTap: () {
                              model.getAddressFromCoordinates(coordinate);
                            },
                          );
                          setState(() {
                            markers.add(tmp);
                          });
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListView(children: [
                      "Location Information".text.bold.xl2.make().px32(),
                      "Please enter details of your current \nlocation or click on the marker in the map"
                          .text
                          .make()
                          .px32(),
                      SizedBox(height: 5),
                      GRoundedTextField(
                        controller: model.placeController,
                        fieldIcon: Icon(Icons.location_on),
                        hintText: "Place",
                        fillColor: ThemeColors.white,
                      ).px16(),
                      SizedBox(height: 5),
                      GRoundedTextField(
                        controller: model.buildNoController,
                        fieldIcon: Icon(Icons.location_city),
                        fillColor: ThemeColors.white,
                        hintText: "Building Number/House Number",
                      ).px16(),
                      SizedBox(height: 5),
                      GRoundedTextField(
                        controller: model.landmarkController,
                        fieldIcon: Icon(Icons.location_searching_outlined),
                        fillColor: ThemeColors.white,
                        hintText: "Landmark",
                      ).px16(),
                      SizedBox(height: 15),
                      GRoundedButton(
                        onPressed: () => model.navigateTo(Routes.homePage),
                        text: "Save",
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textColor: ThemeColors.white,
                        color: ThemeColors.primary,
                      ).px16(),
                      SizedBox(height: 10),
                    ]),
                  ),
                ],
              ),
            ));
  }
}
