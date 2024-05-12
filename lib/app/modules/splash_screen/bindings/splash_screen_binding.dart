import 'package:adella_kitchen/app/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
    Get.put(LoginController());
  }
}
