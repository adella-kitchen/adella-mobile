import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adella_kitchen/app/modules/profile/controllers/cek_riwayat_pesanan_controller.dart';

class CekRiwayatPesananView extends GetView<CekRiwayatPesananController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cek Riwayat Pesanan'),
      ),
      body: Center(
        child: Text('Ini adalah halaman cek riwayat pesanan'),
      ),
    );
  }
}
