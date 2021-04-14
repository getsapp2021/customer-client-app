
import 'package:customer/src/app/locator.dart';
import 'package:customer/src/ui/utils/colors.dart';
import 'package:stacked_services/stacked_services.dart';

showErrorDialog(String message){
  DialogService dialogService = locator<DialogService>();

  dialogService.showDialog(
    title: "Error Occurred!",
    description: message,
  );
}

showNotLoggedInError(){
  DialogService dialogService = locator<DialogService>();

  // TODO: setup custom dialog
  dialogService.showDialog(
    title: "Not Logged in!",
    description: "Authentication is required to view this page.",
    buttonTitle: "Login",
    buttonTitleColor: ThemeColors.primary,
  );
}
