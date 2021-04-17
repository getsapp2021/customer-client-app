import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/ui/views/pages/home/store_home_page.dart';
import 'package:customer/src/ui/views/pages/home/stores_listview.dart';
import 'package:customer/src/ui/views/pages/home/stores_model.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_textfield.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class StoreCategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 110,
          flexibleSpace: Padding(
            padding: EdgeInsets.only(bottom: 10, right: 10, left: 10,top: 80),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(new MaterialPageRoute(
                        builder: (BuildContext context) => StoreHomePage()));
                  },
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    size: 40,
                    color: ThemeColors.white,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: GRoundedTextField(
                      hintText: "  Search for Stores",
                      fillColor: ThemeColors.white,
                      controller: model.searchController,
                      fieldIcon: Icon(
                        Icons.search,
                        color: ThemeColors.body,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(

          children: [

            GridView.count(
              padding: EdgeInsets.only(top: 20),
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              children: List.generate(
                allChoices.length,
                (index) {
                  return SelectCard(choice: allChoices[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
