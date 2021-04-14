import 'package:customer/src/ui/utils/colors.dart';
import 'package:customer/src/ui/views/widgets/g_add_to_cart_viewmodel.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class GAddToCart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GAddToCartViewModel>.reactive(
      viewModelBuilder: () => GAddToCartViewModel(),
      builder: (context, model, child) {
        return GRoundedButton(
          onPressed: () {
            model.addedToCart();
          },
          borderColor: ThemeColors.primary,
          color: model.fillColor,
          borderRadius: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: model.isClicked? checkedItem() : Row(
              children: [
                Text(
                  "ADD",
                  style: TextStyle(fontSize: 16),
                ),
                Icon(Icons.add),
              ],
            ),
          ),
        );
      }
    );
  }

  checkedItem() {
    return Icon(
      Icons.check,
      color: ThemeColors.white,
    );
  }
}
