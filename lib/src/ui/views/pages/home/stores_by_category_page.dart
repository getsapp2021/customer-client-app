import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/ui/views/pages/home/stores_listview.dart';
import 'package:customer/src/ui/views/pages/home/stores_model.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_textfield.dart';
import 'package:customer/src/ui/views/widgets/g_filter_checkbox.dart';
import 'package:customer/src/ui/views/widgets/g_store_item.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class StoresByCategoryPage extends StatefulWidget {
  @override
  _StoresByCategoryPageState createState() => _StoresByCategoryPageState();
}

class _StoresByCategoryPageState extends State<StoresByCategoryPage> {
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
                Icon(Icons.keyboard_arrow_left,
                  size: 40, color: ThemeColors.white,),
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
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height:50,child: FilterCheckBox(
              ),),
              GridView.count(
                padding: EdgeInsets.only(top: 20),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 10,
                children: List.generate(
                  choices.length,
                      (index) {
                    return GStoreItem(
                      notDeliveryAndFeatured: index%2==0 ? true : false,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
