import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:used_market/Home/HomeViewModel.dart';

class HomeView extends GetView<HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => SafeArea(
          child: Column(
            children: [
              Text(controller.welcomeString?.value ?? ""),
              TextButton(
                  onPressed: () {
                    controller.welcomeString?.value = "첫번째 페이지에서 값을 바꿨습니다.";
                  },
                  child: Text("값 변경")),
              TextButton(
                  onPressed: () {
                    controller.requestTodoItem();
                  },
                  child: Text("서버 요청하기")),
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("뒤로가기")),
            ],
          ))),
    );
  }
}