import 'package:customer/src/app/locator.dart';
import 'package:customer/src/core/errors/failure.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

extension BaseViewModelExtension on BaseViewModel {
  static final DialogService _dialogService = locator<DialogService>();

  Future performTryOrFailure(Function execute) async {
    try {
      await execute();
    } on Failure catch (e) {
      if (this.isBusy) setBusy(false);
      _dialogService.showDialog(
        title: "Error Occured!",
        description: e.message,
      );
    }
  }
}
