import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:used_market/Login/LoginModel/LoginModel.dart';
import 'package:used_market/Login/LoginView.dart';

class LoginViewModel extends GetxController {
  RxString? emailStr = "email".obs;
  RxString? passwordStr = "password".obs;

  late RestClient _restClient;

  @override
  void onInit() {
    super.onInit();

    _restClient = GetIt.instance<RestClient>();
  }

  Future<LoginModel?> requestTodoItems() async {
    print("email: ${emailStr?.value}");
    print("email: ${passwordStr?.value}");
    try{
      final reqBody = EmailPW(email: emailStr?.value,password: passwordStr?.value);
      final data = await _restClient.postLogin(reqBody);
      print("data: ${data}");
      //LoginModel loginItem = LoginModel.toJson(data);
      return null;
    }catch(e){
      print("@@@@@");
      print(e);
      print("@@@@@");
    }
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