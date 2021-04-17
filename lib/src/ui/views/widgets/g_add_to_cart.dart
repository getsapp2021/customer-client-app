import 'package:customer/src/ui/utils/theme_colors.dart';
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
            borderColor: ThemeColors.primary,
            borderRadius: 10,
            height: 40,
            width: 80,
            onPressed: () {
              model.addedToCart();
            },
            color: model.fillColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: model.isClicked
                  ? checkedItem()
                  : Row(
                      children: [
                        Text(
                          "ADD",
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(
                          Icons.add,
                          color: ThemeColors.body,
                        ),
                      ],
                    ),
            ),
          );
        });
  }

  checkedItem() {
    return Icon(
      Icons.check,
      color: ThemeColors.white,
    );
  }
}
