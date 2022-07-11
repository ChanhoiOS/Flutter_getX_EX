import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:used_market/Login/LoginModel/LoginModel.dart';
import 'package:used_market/Login/LoginView.dart';

class LoginViewModel extends GetxController {
  RxString? welcomeString = "Login".obs;

  late RestClient _restClient;

  @override
  void onInit() {
    super.onInit();

    welcomeString?.value = "33";
    _restClient = GetIt.instance<RestClient>();
  }

  Future<LoginModel?> requestTodoItems() async {

    try{
      final reqBody = EmailPW(email: "test2",password: "1234");
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