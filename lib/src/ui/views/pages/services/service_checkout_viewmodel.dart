import 'package:customer/src/app/locator.dart';
import 'package:customer/src/core/utils/enums/dialog_type.dart';
import 'package:customer/src/core/utils/enums/service_day.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ServiceCheckoutViewModel extends BaseViewModel {
  ServiceDay _serviceDay = ServiceDay.earliestAvailable;
  ServiceDay get serviceDay => _serviceDay;
  final _dialogService = locator<DialogService>();


  set serviceDay(ServiceDay value) {
    _serviceDay = value;
    notifyListeners();
  }

  void showCalendarDialog(){
    _dialogService.showCustomDialog(
      variant: DialogType.calendar

    );
  }


}