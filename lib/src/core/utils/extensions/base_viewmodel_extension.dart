import 'package:customer/src/app/helper.dart';
import 'package:customer/src/app/locator.dart';
import 'package:customer/src/core/errors/failure.dart';
import 'package:customer/src/ui/utils/helper.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

extension BaseViewModelExtension on BaseViewModel {
  static final DialogService dialogService = locator<DialogService>();

  Future performTryOrHandleFailure(Function execute) async {
    final logger = getLogger("BaseViewModel");

    try {
      await execute();
    } on Failure catch (e, s) {
      logger.e("[performTryOrHandleFailure]: Failure caught", e, s);
      if (this.isBusy) setBusy(false);
      showErrorDialog(e.message);
    } catch (e, s) {
      logger.e("[performTryOrHandleFailure]: Unhandled exception caught", e, s);
      if (this.isBusy) setBusy(false);
      showErrorDialog("Internal error occurred, please try again later!");
    }
  }
}
