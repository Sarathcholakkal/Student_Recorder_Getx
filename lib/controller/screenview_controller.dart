import 'package:get/get.dart';

class ScreenviewController extends GetxController {
  RxBool currentView = true.obs;
  void switchView() {
    currentView.value = currentView.value == true ? false : true;
  }
}
