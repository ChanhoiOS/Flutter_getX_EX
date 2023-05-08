import 'package:get/get.dart';
import 'package:used_market/Home/HomeViewModel.dart';


class HomeViewPage_Binding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeViewModel>(HomeViewModel());
  }
}