import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_button.dart';
import 'package:flutter/material.dart';
class GCheckoutBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GRoundedButton(
        color: ThemeColors.primary,
        child: Row(
          children: [Column(children: [
            Text("Total Payout", style: TextStyle(fontSize: 12, color: ThemeColors.white),),
            Text("Rs 99,999.99", style: TextStyle(fontSize: 16, color: ThemeColors.white),),
          ],),
            Text("ADD TO CART", style: TextStyle(fontSize: 16, color: ThemeColors.white),)
          ],
        ),
      ),
    );
  }
}
