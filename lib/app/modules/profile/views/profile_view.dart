// import 'package:adella_kitchen/app/modules/home/views/widget.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFFBE3144),
              width: double.infinity,
              height: 350,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: const CircleAvatar(
                            radius: 65,
                            backgroundImage:
                                AssetImage('assets/img/avatar.jpg'),
                          ),
                        ),
                        const Text(
                          'Lutfi Hakim',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Lutfihakim@gmail.com',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          '+6282331098776',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 50, // Adjust the top position as needed
                    right: 50,
                    child: Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              color: const Color.fromARGB(255, 246, 245, 245),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TitleCard(
                    text: 'Pesanan',
                    icon: Bootstrap.clipboard2_check_fill,
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
                      SizedBox(width: 30),
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
                      SizedBox(width: 30),
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
                  const SizedBox(width: 10),
                  TitleCard(
                    text: 'Informasi Profil',
                    icon: Bootstrap.person_fill,
                    onPressed: () {
                      Get.toNamed(Routes.PENGATURAN_AKUN);
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
                  const SizedBox(height: 40),
                  const Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Bootstrap.door_open_fill,
                            color: Color(0xFFDC495C),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Logout',
                            style: TextStyle(
                              color: Color(0xFFDC495C),
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
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
