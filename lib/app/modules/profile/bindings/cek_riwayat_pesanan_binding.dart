import 'package:adella_kitchen/app/modules/profile/controllers/cek_riwayat_pesanan_controller.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class CekRiwayatPesananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CekRiwayatPesananController>(
      () => CekRiwayatPesananController(),
    );
  }
}
