import 'package:customer/src/app/locator.dart';
import 'package:customer/src/core/utils/enums/bottom_sheet_type.dart';
import 'package:customer/src/core/utils/enums/dialog_type.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:logger/logger.dart';

class ServiceDetailsViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final log = Logger();

  showCheckoutBottomSheet() async {
    var response = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.checkout,
        title: "Total Payout",
        description: "Rs99,999",
        mainButtonTitle: "Book Now");
    log.i("Response: ${response?.confirmed}");
  }

  showCheckoutDialog() async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.Basic,
      title: "Total Payout",
      description: "Rs.99,999",
      mainButtonTitle: "BOOK NOW",
    );
    log.i("Response: ${response?.confirmed}");
    notifyListeners();
  }

  navigateTo(String routeName) async {
    await _navigationService.navigateTo(routeName);
  }
}
