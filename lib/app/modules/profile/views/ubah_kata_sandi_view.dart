import 'package:adella_kitchen/app/modules/profile/controllers/ubah_kata_sandi_contoller.dart';
import 'package:adella_kitchen/app/modules/profile/views/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UbahKataSandiView extends StatelessWidget {
  final UbahKataSandiContoller ubahKataSandiContoller =
      Get.put(UbahKataSandiContoller());

  final TextEditingController sandiSaatIniController = TextEditingController();
  final TextEditingController sandiBaruController = TextEditingController();
  final TextEditingController konfirmasiSandiBaruController =
      TextEditingController();

  UbahKataSandiView({super.key});

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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Text(
                      'Tetapkan kata sandi baru untuk akun anda agar anda dapat masuk dan mengakses semua fitur',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff4A4A4A),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FormUbahSandi(
                    controller: sandiSaatIniController,
                    labelText: 'Kata Sandi Saat Ini',
                    hintText: 'Masukkan Kata Sandi Kamu',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FormUbahSandi(
                    controller: sandiBaruController,
                    labelText: 'Kata Sandi Baru',
                    hintText: 'Masukkan Kata Sandi Baru',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FormUbahSandi(
                    controller: konfirmasiSandiBaruController,
                    labelText: 'Konfirmasi Kata Sandi',
                    hintText: 'Masukkan Kata Sandi Baru',
                  ),
                ],
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: BtnPrimaryProfile(btnText: 'Ubah Kata Sandi'),
          ),
        ],
      ),
    );
  }
}
