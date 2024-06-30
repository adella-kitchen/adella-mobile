import 'dart:convert';
import 'package:adella_kitchen/app/data/api/api.dart';
import 'package:adella_kitchen/app/routes/app_pages.dart';
import 'package:adella_kitchen/theme/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final storage = const FlutterSecureStorage();
  var isLogin = false.obs;
  RxBool isLoading = false.obs;

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

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> login(String email, String password) async {
    isLoading.value = true;

    try {
      final response = await http.post(
        Uri.parse(Api().login),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final plainTextToken = responseData['token'];
        final userData = responseData['data'];

        if (userData != null) {
          final idUser = userData['id'];
          final emailUser = userData['email'];
          final nameUser = userData['name'];

          print('Token User: $plainTextToken');
          print('Email : $emailUser');
          print('Name : $nameUser');

          await saveUserData(plainTextToken, idUser, emailUser, nameUser);
        } else {
          print('User data is null');
        }

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

  Future<void> logout() async {
    try {
      final token = await storage.read(key: 'token');
      if (token == null) {
        Get.offNamed(Routes.LOGIN);
        return;
      }

      final response = await http.get(
        Uri.parse(Api().logout),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        await storage.delete(key: 'token');
        await storage.delete(key: 'id_user');
        await storage.delete(key: 'email');
        await storage.delete(key: 'name');
        isLogin.value = false;
        Get.offNamed(Routes.LOGIN);
      } else {
        Get.snackbar('Error', 'Failed to logout');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to logout: $e');
    }
  }

  Future<void> saveUserData(
      String token, int idUser, String email, String name) async {
    await storage.write(key: 'token', value: token);
    await storage.write(key: 'id_user', value: idUser.toString());
    await storage.write(key: 'email', value: email);
    await storage.write(key: 'name', value: name);
    print(storage.read(key: 'token'));
  }

  Future<void> checkLoginStatus() async {
    final token = await storage.read(key: 'token');
    if (token != null) {
      isLogin.value = true;
      Get.offNamed(Routes.DASHBOARD);
    } else {
      Get.offNamed(Routes.LOGIN);
    }
  }

  Future<void> logingoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      var result = await googleSignIn.signIn();
      print(result);
      // Di sini Anda bisa menambahkan logika untuk menangani hasil login
      // seperti navigasi ke halaman selanjutnya atau melakukan autentikasi di backend.
    } catch (error) {
      print(error);
    }
  }

  Future<void> printToken() async {
    final token = await storage.read(key: 'token');
    print("Token User: $token");
  }
}
