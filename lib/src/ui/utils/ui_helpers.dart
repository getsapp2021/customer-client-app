import 'package:customer/src/app/locator.dart';
import 'package:customer/src/ui/utils/theme_colors.dart';
import 'package:stacked_services/stacked_services.dart';
import 'dart:async';


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

/// Debounce function is used to execute function after certain timeout - e.g execute onChanged after a pause in textField
// This map will track all your pending function calls
Map<Function, Timer> _timeouts = {};
void debounce(Duration timeout, Function target, [List arguments = const []]) {
  if (_timeouts.containsKey(target)) {
    _timeouts[target].cancel();
  }

  Timer timer = Timer(timeout, () {
    Function.apply(target, arguments);
  });

  _timeouts[target] = timer;
}
