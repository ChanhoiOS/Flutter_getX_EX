import 'package:get/get.dart';
import 'package:used_market/Login/LoginPage_Binding.dart';
import 'package:used_market/route/app_routes.dart';
import '../Login/LoginView.dart';



class AppPages {
  static final List<GetPage> pages = [
      GetPage(
        name: AppRoutes.Login,
        page: () => LoginView(),
        binding: LoginPage_Binding()),
  ];
}