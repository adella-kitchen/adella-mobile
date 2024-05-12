import 'package:adella_kitchen/app/modules/login/controllers/login_controller.dart';
import 'package:adella_kitchen/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  final LoginController loginController = Get.find<LoginController>();
  @override
  void onInit() {
    super.onInit();
    loginController.checkLoginStatus();

  }
  void decideNextScreen() {
    // Tambahkan logika untuk menentukan halaman selanjutnya berdasarkan status login
    if (loginController.isLogin.value) {
      // Jika sudah login, arahkan ke halaman Dashboard
      Get.offNamed(Routes.DASHBOARD);
    } else {
      // Jika belum login, arahkan ke halaman Login
      Get.offNamed(Routes.LOGIN);
    }
  }
}
