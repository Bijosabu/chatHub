import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:litehub/controller/login_or_register_controller.dart';
import 'package:litehub/view/Authentication/login_page.dart';
import 'package:litehub/view/Authentication/register_page.dart';

class LoginOrRegister extends StatelessWidget {
  LoginOrRegister({super.key});
  final toggleController = Get.put(ToggleScreen());
  @override
  Widget build(BuildContext context) {
    if (toggleController.showLoginPage.value) {
      return LoginPage(
        onTap: toggleController.toggleScreen,
      );
    } else {
      return RegisterPage(onTap: toggleController.toggleScreen);
    }
  }
}
