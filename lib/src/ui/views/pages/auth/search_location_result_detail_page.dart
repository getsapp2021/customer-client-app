import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:customer/src/app/router.gr.dart';
import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/ui/views/pages/auth/search_location_result_detail_viewmodel.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_button.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_textfield.dart';

class SearchLocationResultDetailPage extends StatelessWidget {
  final Coordinates coordinate;
  SearchLocationResultDetailPage({@required this.coordinate});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchLocationResultDetailViewModel>.reactive(
        viewModelBuilder: () => SearchLocationResultDetailViewModel(),
        onModelReady: (model) => model.initialise(coordinate),
        builder: (context, model, child) => Scaffold(
              backgroundColor: ThemeColors.white,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 0.5 * MediaQuery.of(context).size.height,
                      child: GoogleMap(
                        onMapCreated: model.onMapCreated,
                        markers: Set.from(model.markers),
                        initialCameraPosition: CameraPosition(
                          target:
                              LatLng(coordinate.latitude, coordinate.longitude),
                          zoom: 15.0,
                        ),
                        onTap: (pos) {
                          print("Position: $pos");
                          Coordinates tappedCoordinate =
                              Coordinates(pos.latitude, pos.longitude);

                          Marker tmp = Marker(
                            markerId: MarkerId("Home"),
                            position: pos,
                            draggable: true,
                            onTap: () {
                              model.getAddressFromCoordinates(tappedCoordinate);
                            },
                          );
                          model.resetMarkers();
                          model.addMarker(tmp);
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListView(children: [
                      Text("Location Information"),
                      Text("Please enter details of your current \nlocation or click on the marker in the map"),
                      SizedBox(height: 5),
                      GRoundedTextField(
                        controller: model.placeController,
                        fieldIcon: Icon(Icons.location_on),
                        hintText: "Place",
                        fillColor: ThemeColors.white,
                      ),
                      SizedBox(height: 5),
                      GRoundedTextField(
                        controller: model.buildNoController,
                        fieldIcon: Icon(Icons.location_city),
                        fillColor: ThemeColors.white,
                        hintText: "Building Number/House Number",
                      ),
                      SizedBox(height: 5),
                      GRoundedTextField(
                        controller: model.landmarkController,
                        fieldIcon: Icon(Icons.location_searching_outlined),
                        fillColor: ThemeColors.white,
                        hintText: "Landmark",
                      ),
                      SizedBox(height: 15),
                      GRoundedButton(
                        onPressed: () => model.navigateTo(Routes.homePage),
                        text: "Save",
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textColor: ThemeColors.white,
                        color: ThemeColors.primary,
                      ),
                      SizedBox(height: 10),
                    ]),
                  ),
                ],
              ),
            ));
  }
}
