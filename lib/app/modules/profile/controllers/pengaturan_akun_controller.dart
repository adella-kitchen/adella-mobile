import 'package:adella_kitchen/app/modules/profile/views/pengaturan_akun_view.dart';
import 'package:get/get.dart';

class PengaturanAkunController extends GetxController {
  //TODO: Implement ProfileController

  var text = ''.obs;

// class PengaturanAkunController extends GetxController {
//   late TextEditingController nameLengkap;
//   late TextEditingController notelp;
//   late TextEditingController email;

//   void onInit() {
//     super.onInit();
//     nameLengkap = TextEditingController();
//     notelp = TextEditingController();
//     email = TextEditingController();
//   }

  void onClose() {
    super.onClose();
    // nameLengkap.dispose();
    // notelp.dispose();
    // email.dispose();
  }

  void pengaturanProfile(String name, int notelp, String email) {
    Get.off(() => PengaturanAkunView());
  }
}
