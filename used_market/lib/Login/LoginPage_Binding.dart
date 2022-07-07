import 'package:get/get.dart';
import 'package:used_market/Login/LoginViewModel.dart';

class LoginPage_Binding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginViewModel>(LoginViewModel());
  }
}