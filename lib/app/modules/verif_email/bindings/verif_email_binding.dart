import 'package:get/get.dart';

import '../controllers/verif_email_controller.dart';

class VerifEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifEmailController>(
      () => VerifEmailController(),
    );
  }
}
