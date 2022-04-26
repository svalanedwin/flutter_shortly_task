import 'package:flutter_shorlty_task/controllers/introduction_view_controller.dart';
import 'package:get/get.dart';

class IntroductionViewBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(IntroductionViewController());
  }

}