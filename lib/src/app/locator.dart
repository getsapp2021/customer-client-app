import 'package:customer/src/core/services/authentication_service.dart';
import 'package:customer/src/core/services/user_profile_service.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => UserProfileService());
  locator.registerLazySingleton(() => AuthenticationService());

  // Third Party Services
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
}
