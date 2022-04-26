import 'package:flutter_shorlty_task/controllers/shorten_view_controller.dart';
import 'package:get/get.dart';

class ShortenViewBinding implements Bindings{
  @override
  void dependencies() {
      Get.put(ShortenViewController());
  }

}