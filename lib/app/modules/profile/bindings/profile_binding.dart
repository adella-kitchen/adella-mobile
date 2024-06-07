import 'package:adella_kitchen/app/modules/profile/controllers/cek_riwayat_pesanan_controller.dart';
import 'package:adella_kitchen/app/modules/profile/controllers/pengaturan_akun_controller.dart';
import 'package:adella_kitchen/app/modules/profile/controllers/pengaturan_alamat_controller.dart';
import 'package:adella_kitchen/app/modules/profile/controllers/tambah_alamat_controller.dart';
import 'package:adella_kitchen/app/modules/profile/controllers/ubah_kata_sandi_contoller.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<CekRiwayatPesananController>(
      () => CekRiwayatPesananController(),
    );
    Get.lazyPut<PengaturanAkunController>(
      () => PengaturanAkunController(),
    );
    Get.lazyPut<UbahKataSandiContoller>(
      () => UbahKataSandiContoller(),
    );
    Get.lazyPut<PengaturanAlamatController>(
      () => PengaturanAlamatController(),
    );
    Get.lazyPut<TambahAlamatController>(
      () => TambahAlamatController(),
    );
  }
}
