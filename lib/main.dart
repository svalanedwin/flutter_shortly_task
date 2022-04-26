import 'package:flutter/material.dart';
import 'package:flutter_shorlty_task/constants/app_constants.dart';
import 'package:flutter_shorlty_task/routes/app_routes.dart';
import 'package:flutter_shorlty_task/routes/app_views.dart';
import 'package:flutter_shorlty_task/services/pref_service.dart';
import 'package:get/get.dart';

import 'locales/locales.dart';
import 'themes/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => SharedPrefService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      debugShowCheckedModeBanner: false,
      getPages: AppViews.appViews,
      initialRoute: AppRoutes.initialView,
      locale: Locales.fallbackLocale,
      translations: Locales(),
      fallbackLocale: Locales.fallbackLocale,
    );
  }
}