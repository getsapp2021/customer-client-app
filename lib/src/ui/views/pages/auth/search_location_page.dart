import 'package:customer/src/ui/utils/theme_colors.dart';
import 'package:customer/src/ui/utils/themes.dart';
import 'package:customer/src/ui/views/pages/auth/search_location_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:customer/src/ui/views/widgets/gets_common_widgets.dart';
import 'package:customer/src/ui/utils/ui_helpers.dart';

class SearchLocationPage extends StatelessWidget {
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ViewModelBuilder<SearchLocationViewModel>.nonReactive(
      viewModelBuilder: () => SearchLocationViewModel(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          leading: GBackButton(
            color: ThemeColors.white,
          ),
          title: Text(
            "Search Location",
            style: TextStyle(
                color: ThemeColors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: ThemeColors.primary,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: GTextFormField(
                onChanged: (value) => debounce(
                    Duration(milliseconds: 500), model.onInputChanged, [value]),
                enableInteractiveSelection: false,
                prefixIcon: Icon(Icons.search),
                suffixIcon: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (model.isBusy)
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: GCircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    GestureDetector(
                      onTap: () => model.clearSearchTextField(),
                      child: Icon(Icons.close, size: 18),
                    ),
                  ],
                ),
                controller: model.searchLocationTextEditingController,
                hintText: "Search for location",
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  // color: Colors.red,
                  backgroundColor: ThemeColors.white,
                  child: Icon(
                    Icons.my_location,
                    color: ThemeColors.primary,
                  ),
                ),
                title: Text("Use Current Location",
                    style: kTSPrimaryColorSemiBold),
                subtitle: Text("Using GPS"),
                onTap: () {},
              ),
              Divider(thickness: 8, color: ThemeColors.grey),
              if (!model.hasSuggestions) ...{
                Padding(
                  padding: EdgeInsets.only(top: 70),
                  child: Center(
                    child: Image.asset(
                      "assets/images/auth/search_location_illustration.png",
                      width: width * 0.7,
                    ),
                  ),
                ),
              } else ...{
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Text("RESULTS",
                      style: kTSBodyColorBold.copyWith(fontSize: 16)),
                ),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: model.suggestions.length,
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.grey,
                    height: 0,
                  ),
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(

                      backgroundColor: ThemeColors.transparent,
                      child: Icon(
                        Icons.location_on_outlined,
                        color: ThemeColors.body,
                      ),
                    ),
                    title: Text(
                      model.suggestions[index].mainText,
                      style: kTSBodyColorMedium,
                    ),
                    subtitle: Text(
                      model.suggestions[index].secondaryText,
                      style: kTSBodyColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {},
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    "assets/images/auth/powered_by_google_on_white_hdpi.png",
                    width: width * 0.4,
                  ),
                ),
                SizedBox(height: 30),
              }
            ],
          ),
        ),
      ),
    );
  }
}
//
// class AddressSearch extends SearchDelegate {
//   final SearchLocationViewModel viewModel;
//
//   AddressSearch(this.viewModel)
//       : super(searchFieldLabel: "Search for location");
//
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         tooltip: 'Clear',
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       )
//     ];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       tooltip: 'Back',
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     return buildSuggestions(context);
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     if (query == '') return Container();
//     viewModel.input = query;
//     return FutureBuilder(
//       future: viewModel.fetchSuggestions(),
//       builder: (context, AsyncSnapshot<List<Suggestion>> snapshot) {
//         return !snapshot.hasData
//             ? Center(child: CircularProgressIndicator())
//             : ListView.builder(
//                 itemBuilder: (context, index) => ListTile(
//                   title: Text(snapshot.data[index].description),
//                   onTap: () => viewModel
//                       .navigateToResultPage(snapshot.data[index].placeId),
//                 ),
//                 itemCount: snapshot.data.length,
//               );
//       },
//     );
//   }
//
//   @override
//   PreferredSizeWidget buildBottom(BuildContext context) {}
// }
