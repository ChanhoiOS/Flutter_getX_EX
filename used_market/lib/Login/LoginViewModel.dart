import 'package:dio/dio.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  RxString? welcomeString = "Login".obs;

  @override
  void onInit() {
    super.onInit();

    welcomeString?.value = "33";

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}