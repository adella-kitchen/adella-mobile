import 'package:adella_kitchen/app/modules/profile/controllers/pengaturan_alamat_controller.dart';
import 'package:adella_kitchen/app/modules/profile/controllers/ubah_kata_sandi_contoller.dart';
import 'package:adella_kitchen/app/modules/profile/views/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PengaturanAlamatView extends GetView<PengaturanAlamatController> {
  const PengaturanAlamatView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text(
          'Pengaturan Alamat',
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
