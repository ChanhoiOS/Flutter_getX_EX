import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:used_market/Login/LoginViewModel.dart';

class LoginView extends GetView<LoginViewModel> {

  final idTextEditController = TextEditingController();
  final pwTextEditController = TextEditingController();

  @override
  void dispose() {
      idTextEditController.dispose();
      pwTextEditController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: Get.width,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 74),
              child: Image.asset('assets/toolBox.png',
                  width: 104.0, height: 104.0),
            ),
            _renderTextField(placeholder: "Email"),
            _renderTextField(placeholder: "password"),
            _renderPasswordForgetWidget(),
            _renderLoginButton(type: "login"),
            _renderORView(),
            _renderLoginButton(type: "Kakao"),
            _renderSignup()
          ],
        ),
      )),
    );
  }

  _renderSignup() {
    return Container(
        margin: EdgeInsets.only(top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("아직 아이디가 없으신가요?"),
            ),
            Container(
              child: TextButton(
                onPressed: () {},
                child: Text("가입하기"),
              ),
            ),
          ],
        ));
  }

  _renderORView() {
    return Container(
      width: Get.width,
      margin: EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Container(
            color: Colors.grey,
            height: 1,
            width: Get.width / 3,
            alignment: Alignment.centerLeft,
          ),
          Container(
            width: Get.width / 3,
            child: Text(
              "OR",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            color: Colors.grey,
            height: 1,
            width: Get.width / 3,
            alignment: Alignment.centerRight,
          ),
        ],
      ),
    );
  }

  _renderLoginButton({String? type}) {
    return Container(
      width: Get.width,
      height: 48,
      color: type == "Kakao" ? Colors.yellow : Colors.black,
      margin: EdgeInsets.only(top: 14, left: 16, right: 16),
      child: OutlineButton(
        onPressed: () {
          controller.requestTodoItems();
        },
        child: Text(
          "로그인하기",
          style: TextStyle(
              color: type == "Kakao" ? Colors.black : Colors.white,
              fontSize: 12),
        ),
      ),
    );
  }

  _renderTextField({String? placeholder}) {
    return Container(
      margin: EdgeInsets.only(
          top: placeholder == "Email" ? 90 : 19, left: 16, right: 16),
      height: 48,
      child: TextField(
        controller: placeholder == "Email" ? idTextEditController : pwTextEditController,
        decoration: InputDecoration(
          hintText: placeholder ?? "",
          hintStyle: TextStyle(fontSize: 16),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.1, color: Colors.grey),
          ),
        ),
        onChanged: (text) {
          if (placeholder == "Email") {
            controller.emailStr = text.obs;
          } else {
            controller.passwordStr = text.obs;
          }

        },
      ),
    );
  }

  _renderPasswordForgetWidget() {
    return Container(
      margin: EdgeInsets.only(top: 19),
      width: Get.width,
      padding: EdgeInsets.only(right: 16),
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          "비밀번호를 잊으셨나요?",
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
