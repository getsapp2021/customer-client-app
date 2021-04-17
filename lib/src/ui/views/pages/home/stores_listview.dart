import 'package:customer/src/ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'stores_model.dart';

class SelectCard extends StatelessWidget {
  const SelectCard({Key key, this.choice,this.ontap}) : super(key: key);
  final Category choice;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      color: ThemeColors.body,
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    return GestureDetector(
      onTap: ontap,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 45,
                child: Image.asset(choice.image,
                  fit: BoxFit.contain,
                ),
            ),
            SizedBox(height: 10,),
            Text(choice.title, style: textStyle,textAlign: TextAlign.center,),
          ]),
    );
  }
}
