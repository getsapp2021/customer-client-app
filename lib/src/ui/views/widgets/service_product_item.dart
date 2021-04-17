import 'package:customer/src/ui/utils/theme_colors.dart';
import 'package:customer/src/ui/views/widgets/g_add_to_cart.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ServiceProductItem extends StatelessWidget {
  final Function onTap;

  const ServiceProductItem({Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Haircut",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SmoothStarRating(
                allowHalfRating: true,
                starCount: 5,
                rating: 4,
                size: 14,
                color: ThemeColors.primary,
                borderColor: ThemeColors.primary,
              ),
              Text("Rs.200",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          GAddToCart(),   
        ],
      ),
    );

    // ListTile(
    //   title: Text("Haircut", style: TextStyle(fontSize: 16)),
    //   subtitle: Text("Rs.200", style: TextStyle(fontSize: 14)),
    //   trailing: GAddToCart(),
    //   onTap: onTap,
    // );
  }
}
