import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wazzup/lib/utils/AppConstants.dart';
import 'package:wazzup/lib/utils/AppDependencies.dart';
import 'package:wazzup/lib/utils/AppRoutes.dart';

import 'lib/utils/AppUtils.dart';
import 'lib/utils/ColorConstants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppDependencies.addDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // scaffoldBackgroundColor: ColorConstants.whiteColor,
            primarySwatch: AppUtils.createMaterialColor(),
            appBarTheme: AppBarTheme(
              color: ColorConstants.primaryColor,
            ),
            bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: Colors.black.withOpacity(0),
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: ColorConstants.primaryColor,
            )
        ),
        initialRoute: AppRoutes.splashPageRoute,
        onGenerateRoute: RoutesGenerator.generateRoute
      // home: const MyHomePage(),
    );
  }
}

