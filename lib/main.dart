import 'package:flutter/material.dart';
import 'package:animated_bakery/app/app.bottomsheets.dart';
import 'package:animated_bakery/app/app.dialogs.dart';
import 'package:animated_bakery/app/app.locator.dart';
import 'package:animated_bakery/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(filledButtonTheme: FilledButtonThemeData(style: FilledButton.styleFrom(backgroundColor: Colors.black))),
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
