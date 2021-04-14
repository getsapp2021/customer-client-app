import 'package:customer/src/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StoreProductItemViewModel extends BaseViewModel {
  BottomSheetService _bottomSheetService = locator<BottomSheetService>();

  void showProductDetails() async { 
    await _bottomSheetService.showCustomSheet(title: null);
  }
}