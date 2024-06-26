import 'dart:convert';
import 'package:adella_kitchen/app/data/api/api.dart';
import 'package:adella_kitchen/app/routes/app_pages.dart';
import 'package:adella_kitchen/theme/widget/app_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController pass;
  late TextEditingController confirmPass;

  RxBool isLoading = false.obs;

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

  Future<void> register(String name, String email, String pass) async {
    isLoading.value = true;

    try {
      final response = await http.post(Uri.parse(Api().register), body: {
        'name': name,
        'email': email,
        'password': pass,
      });

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print('Registration successful: ${responseData['message']}');
        CustomSnackBar.showSuccess('Sukses', 'Resgitrasi akun berhasil');
        Get.offNamed(Routes.LOGIN);
      } else {
        final responseData = json.decode(response.body);
        print('Registration failed: ${responseData['message']}');
        CustomSnackBar.showWarning('Gagal', 'Resgitrasi gagal');
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
