import 'package:customer/src/core/services/authentication_service.dart';
import 'package:customer/src/core/services/firestore_service.dart';
import 'package:customer/src/core/services/user_profile_service.dart';
import 'package:customer/src/core/utils/g_log_printer.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:customer/src/core/services/permission_service.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => UserProfileService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => PermissionService());
  locator.registerLazySingleton(() => FirestoreService());

  // Third Party Services
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());

  locator.registerLazySingleton(() => Logger(printer: GLogPrinter()));
}
