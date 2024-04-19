import 'package:adella_kitchen/app/modules/login/views/login_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RegisterController extends GetxController {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController pass;
  late TextEditingController confirmPass;

  @override
  void onInit() {
    super.onInit();
    name = TextEditingController();
    email = TextEditingController();
    pass = TextEditingController();
    confirmPass = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    name.dispose();
    email.dispose();
    pass.dispose();
    confirmPass.dispose();
  }

  void register(String name, String email, String pass, String validPass) {
    Get.off(() => LoginView());
  }
}
