import 'dart:ui';

import 'package:customer/src/ui/utils/colors.dart';
import 'package:stacked/stacked.dart';

class GAddToCartViewModel extends BaseViewModel {
  bool isClicked = false;
  Color fillColor = ThemeColors.white;
  void addedToCart(){
    if(!isClicked){
      isClicked = true;
       fillColor = ThemeColors.primary;
    }
    else{
      isClicked = false;
      fillColor = ThemeColors.white;
    }
    notifyListeners();
  }

}