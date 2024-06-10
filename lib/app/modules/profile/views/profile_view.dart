// import 'package:adella_kitchen/app/modules/home/views/widget.dart';
import 'package:adella_kitchen/app/modules/login/controllers/login_controller.dart';
import 'package:adella_kitchen/app/modules/profile/views/widget.dart';
import 'package:adella_kitchen/app/routes/app_pages.dart';
// import 'package:adella_kitchen/theme/app_theme.dart';
// import 'package:adella_kitchen/theme/color.dart';
// import 'package:adella_kitchen/theme/widget/app_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:get/get_core/get_core.dart';
import 'package:icons_plus/icons_plus.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    final authController = Get.put(LoginController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                color: const Color(0xFFBE3144),
                width: double.infinity,
                height: 170,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      alignment: Alignment.centerLeft,
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/img/avatar.jpg'),
                      ),
                    ),
                    // Tambahkan Column di sini
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lutfi Hakim',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Lutfihakim@gmail.com',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              color: const Color.fromARGB(255, 246, 245, 245),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TitleCard(
                    text: 'Pesanan',
                    icon: Bootstrap.clipboard2_data_fill,
                    textLeading: 'Cek riwayat pesanan',
                    iconLeading: Icons.arrow_forward_ios_outlined,
                    onPressed: () => Get.toNamed(Routes.CEK_RIWAYAT_PESANAN),
                  ),
                  const SizedBox(height: 30),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Image(
                            image: AssetImage(
                                'assets/img/pesanan_dalam_proses.png'),
                          ),
                          SizedBox(height: 20, width: 30),
                          SizedBox(
                            width: 85,
                            child: Text(
                              'Pesanan Dalam Proses',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Image(
                            image: AssetImage('assets/img/pesanan_dikirim.png'),
                          ),
                          SizedBox(height: 20, width: 30),
                          SizedBox(
                            width: 85,
                            child: Text(
                              'Pesanan Dikirim',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Image(
                            image:
                                AssetImage('assets/img/pesanan_diterima.png'),
                          ),
                          SizedBox(height: 20, width: 30),
                          SizedBox(
                            width: 85,
                            child: Text(
                              'Pesanan Diterima',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  TitleCard(
                    text: 'Informasi Profil',
                    icon: Bootstrap.person_fill,
                    onPressed: () {
                      Get.toNamed(Routes.PENGATURAN_AKUN);
                    },
                  ),
                  const SizedBox(height: 30),
                  TitleCard(
                    text: 'Notifikasi',
                    icon: Icons.notifications,
                    onPressed: () {
                      Get.toNamed(Routes.NOTIFIKASI);
                    },
                  ),
                  const SizedBox(height: 30),
                  TitleCard(
                    text: 'Ubah Kata sandi',
                    icon: Bootstrap.lock_fill,
                    onPressed: () {
                      Get.toNamed(Routes.UBAH_KATA_SANDI);
                    },
                  ),
                  const SizedBox(height: 30),
                  TitleCard(
                    text: 'Pengaturan alamat',
                    icon: Icons.location_pin,
                    onPressed: () {
                      Get.toNamed(Routes.PENGATURAN_ALAMAT);
                    },
                  ),
                  const SizedBox(height: 50),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Bootstrap.door_open_fill,
                            color: Color(0xFFDC495C),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Konfirmasi Logout'),
                                    content: const Text(
                                        'Apakah Anda yakin ingin logout?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          // Tutup dialog
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Batal'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          // Lakukan logout
                                          authController.logout();
                                          // Tutup dialog
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          'Logout',
                                          style: TextStyle(
                                            color: Color(0xFFDC495C),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Text(
                              'Logout',
                              style: TextStyle(
                                color: Color(0xFFDC495C),
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
