import 'package:get/get.dart';

import '../controllers/step_page_controller.dart';

class StepPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StepPageController>(
      () => StepPageController(),
    );
  }
}
