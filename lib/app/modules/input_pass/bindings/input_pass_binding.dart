import 'package:get/get.dart';

import '../controllers/input_pass_controller.dart';

class InputPassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InputPassController>(
      () => InputPassController(),
    );
  }
}
