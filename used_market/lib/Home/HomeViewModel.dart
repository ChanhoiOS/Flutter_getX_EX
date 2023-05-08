import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:used_market/Home/HomeView.dart';
import 'package:used_market/Home/HomeModel/HomeModel.dart';

class HomeViewModel extends GetxController {

    RxString? welcomeString = "두번째 페이지 입니다".obs;

    late HomeClient _homeClient;

    @override
    void onInit() {
      super.onInit();

      _homeClient = GetIt.instance<HomeClient>();
    }

    Future<SaleItem?> requestTodoItem() async {
      try{
        final reqBody = GetSaleParam(user_id: '25', lon: '37.5642135', lat: '127.0016985', start: '0',end: '20');
        final data = await _homeClient.getSaleItem(reqBody);
        print("data: ${data}");
        //LoginModel loginItem = LoginModel.toJson(data);
        return null;
      }catch(e){
        print("@@@@@");
        print(e);
        print("@@@@@");
      }
    }

}
