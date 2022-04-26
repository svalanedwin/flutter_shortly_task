import 'package:flutter_shorlty_task/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/helpers/shared.dart';

class WelcomeViewController extends GetxController{
  void onPressed(){
      if(shared.getFirstLogin()){
          Get.offNamed(AppRoutes.introductionView);
          return;
      }
      Get.offNamed(AppRoutes.shortenView);
  }
}