import 'dart:convert';
import 'package:adella_kitchen/app/routes/app_pages.dart';
import 'package:adella_kitchen/theme/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  var isLogin = false.obs;
  var ip = '192.168.1.5';
  var isLoading = false.obs;

  void initEmailController() {
    emailController = TextEditingController();
  }

  void initPasswordController() {
    passwordController = TextEditingController();
  }

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    checkLoginStatus();
    printToken();
  }

  // @override
  // void onClose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.onClose();
  // }

  Future<void> login(String email, String password) async {
    isLoading.value = true;

    String apiUrl = 'http://$ip:8000/api/login';

    try {
      final response = await http.post(Uri.parse(apiUrl), body: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        final plainTextToken = responseData['token'];
        print('Token: $plainTextToken');

        await saveToken(plainTextToken);

        isLogin.value = true;
        Get.offNamed(Routes.DASHBOARD);

        final successMessage = responseData['message'];
        CustomSnackBar.showSuccess('Berhasil Login', successMessage);
      } else {
        final responseData = json.decode(response.body);
        final errorMessage = responseData['message'];
        CustomSnackBar.showWarning('Gagal Login', errorMessage);
      }
    } catch (e) {
      print('Error: $e');
      CustomSnackBar.showError('Error', '$e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedToken = prefs.getString('token');

    isLogin.value = savedToken != null;

    if (savedToken == null) {
      Get.offNamed(Routes.LOGIN);
    }
  }

  Future<void> printToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedToken = prefs.getString('token');
    print('Token on app start: $savedToken');
  }
}
