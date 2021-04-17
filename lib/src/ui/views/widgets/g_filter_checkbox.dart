import 'package:customer/src/ui/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterCheckBox extends StatefulWidget {
  @override
  _FilterCheckBoxState createState() => _FilterCheckBoxState();
}

class _FilterCheckBoxState extends State<FilterCheckBox> {
  List<String> filterOption = ["All", "Available", "Rating", "Rating 2"];
  String currentSelectedOption = "All";


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: filterOption.length,
      itemBuilder: (BuildContext context, int index) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: GestureDetector(
          onTap: () {
            setState(() {
              currentSelectedOption = filterOption[index];
            });
          },
          child: Row(
              children: [
                currentSelectedOption ==  filterOption[index] ? Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(Icons.check,size: 20,),
                ) : Container(),
                // SizedBox(width: 20,),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(filterOption[index]),
                ),
              ],
            ),
        ),

      ),
    );
  }
}
