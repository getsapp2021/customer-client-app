import 'package:customer/src/app/router.gr.dart';
import 'package:customer/src/ui/utils/themes.dart';
import 'package:customer/src/ui/views/widgets/bottomsheet/setup_bottom_sheet_ui.dart';
import 'package:customer/src/ui/views/widgets/bottomsheet/setup_dialog_ui.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:customer/src/app/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Gets Customer App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: GTheme.lightTheme(context),
      initialRoute: Routes.storeHomePage,
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
