import 'package:flutter_shorlty_task/controllers/welcome_view_controller.dart';
import 'package:flutter_shorlty_task/routes/app_routes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

class MockWelcomeViewController extends GetxController
    with Fake
    implements WelcomeViewController {

  @override
  void onPressed(){
      Get.offNamed(AppRoutes.introductionView);
    }
}
