import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:used_market/route/app_pages.dart';
import 'package:used_market/route/app_routes.dart';
import 'package:used_market/util/SetupLocator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return GetMaterialApp(
        initialRoute: AppRoutes.Login,
        getPages: AppPages.pages,
      );
  }
}