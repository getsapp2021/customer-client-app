import 'package:customer/src/core/models/suggestion.dart';
import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/ui/views/pages/auth/search_location_viewmodel.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_textfield.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SearchLocationPage extends StatefulWidget {
  @override
  _SearchLocationPageState createState() => _SearchLocationPageState();
}

final _searchController = TextEditingController();

class _SearchLocationPageState extends State<SearchLocationPage> {
  // static const String placesApi = "AIzaSyAc1T_GRwqrpiA6kTTbbQROaj0_PG19IJ4";

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchLocationViewModel>.nonReactive(
      viewModelBuilder: () => SearchLocationViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: AppBar(
            leading: Icon(
              Icons.keyboard_arrow_left,
              color: ThemeColors.white,
            ),
            title: Text(
              "Search Location",
              style: TextStyle(color: ThemeColors.white),
            ),
            backgroundColor: ThemeColors.primary,
            flexibleSpace: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 10, 0, 10),
              child: Flex(direction: Axis.horizontal, children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GRoundedTextField(
                    controller: _searchController,
                    ontap: () async {
                      print("On Tapped");
                      FocusScope.of(context).requestFocus(FocusNode());
                      await showSearch(
                        context: context,
                        // we haven't created AddressSearch class
                        // this should be extending SearchDelegate
                        delegate: AddressSearch(model),
                      );
                    },
                    fillColor: ThemeColors.white,
                    fieldIcon: Icon(
                      Icons.search,
                    ),
                    hintText: "Search for location",
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class AddressSearch extends SearchDelegate {
  final SearchLocationViewModel viewModel;

  AddressSearch(this.viewModel);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == '') return Container();
    viewModel.input = query;
    return FutureBuilder(
      future: viewModel.fetchSuggestions(),
      builder: (context, AsyncSnapshot<List<Suggestion>> snapshot) {
        return !snapshot.hasData
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  title: Text(snapshot.data[index].description),
                  onTap: () => viewModel
                      .navigateToResultPage(snapshot.data[index].placeId),
                ),
                itemCount: snapshot.data.length,
              );
      },
    );
  }
}
