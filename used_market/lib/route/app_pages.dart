import 'package:get/get.dart';
import 'package:used_market/Login/LoginPage_Binding.dart';
import 'package:used_market/route/app_routes.dart';
import '../Login/LoginView.dart';
import 'package:used_market/Home/HomeView.dart';
import 'package:used_market/Home/HomePage_Binding.dart';

class AppPages {
  static final List<GetPage> pages = [
      GetPage(
        name: AppRoutes.Login,
        page: () => LoginView(),
        binding: LoginPage_Binding()),
      GetPage(
          name: AppRoutes.HomeView,
          page: () => HomeView(),
          binding: HomeViewPage_Binding()),
  ];
}