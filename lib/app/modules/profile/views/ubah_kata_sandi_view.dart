import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adella_kitchen/app/modules/profile/controllers/cek_riwayat_pesanan_controller.dart';

class UbahKataSandiView extends GetView<CekRiwayatPesananController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text(
          'Ubah Kata Sandi',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: const [],
      ),
    );
  }
}
