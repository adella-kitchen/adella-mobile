import 'dart:convert';
import 'package:adella_kitchen/app/modules/dashboard/views/dashboard_view.dart';
import 'package:adella_kitchen/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  var ip = '192.168.8.134';
  var isLoading = false.obs;
  var token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> login(String email, String password) async {
    isLoading.value = true;

    String apiUrl = 'http://$ip:8000/api/login';

    try {
      final response = await http.post(Uri.parse(apiUrl), body: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        // Respons JSON yang diterima
        final responseData = json.decode(response.body);

        // Ambil nilai dari kunci 'plainTextToken'
        final plainTextToken = responseData['token'];
        final name = responseData['name'];

        // Cetak token di console
        print('Token: $plainTextToken');

        // Lanjutkan sesuai kebutuhan
        Get.offNamed(Routes.DASHBOARD);
      } else {
        // Gagal login, tampilkan pesan kesalahan
        final responseData = json.decode(response.body);
        final errorMessage = responseData['message'];
        Get.snackbar('Login Error', errorMessage);
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar('Error', 'Failed to login');
    } finally {
      isLoading.value = false;
    }
  }
}
