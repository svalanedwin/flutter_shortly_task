import 'package:flutter_shorlty_task/controllers/welcome_view_controller.dart';
import 'package:get/get.dart';

class WelcomeViewBinding implements Bindings {
  @override
  void dependencies() {
      Get.put(WelcomeViewController());
  }

}