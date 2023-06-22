import 'package:get/get.dart';

class ToggleScreen extends GetxController {
  RxBool showLoginPage = true.obs;
  void toggleScreen() {
    showLoginPage != showLoginPage;
    print(showLoginPage);
  }
}
