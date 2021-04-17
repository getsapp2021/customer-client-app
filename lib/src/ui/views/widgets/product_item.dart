import 'package:customer/src/ui/utils/theme_colors.dart';
import 'package:customer/src/ui/views/widgets/g_add_to_cart.dart';
import 'package:customer/src/ui/views/widgets/g_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 60,
                child: Placeholder(),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Apple Iphone 12",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text("Mobile Phone", style: TextStyle(fontSize: 14)),
                  SmoothStarRating(
                    allowHalfRating: true,
                    starCount: 5,
                    rating: 4,
                    size: 14,
                    color: ThemeColors.primary,
                    borderColor: ThemeColors.primary,
                  ),
                  Text(
                    "Rs.54,500",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          // SizedBox(width: 50),
          GAddToCart(),
        ],
      ),
    );
  }
}
