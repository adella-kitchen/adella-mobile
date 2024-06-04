import 'package:adella_kitchen/app/modules/home/views/widget.dart';
import 'package:adella_kitchen/app/modules/profile/views/widget.dart';
import 'package:adella_kitchen/app/routes/app_pages.dart';
import 'package:adella_kitchen/theme/app_theme.dart';
import 'package:adella_kitchen/theme/color.dart';
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
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text('Profile',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Material(
              color: const Color(0xFFDC495C),
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(10),
                child: PopupMenuButton<int>(
                  onSelected: (int result) {
                    // Handle menu item selection
                    Text('Menu item $result selected');
                  },
                  offset: const Offset(0, 50),
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
                    const PopupMenuItem<int>(
                      value: 1,
                      child: Row(
                        children: [
                          Icon(Icons.logout, color: Color(0xFFDC495C)),
                          SizedBox(width: 10),
                          Text('Logout'),
                        ],
                      ),
                    ),
                  ],
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
        backgroundColor: myColor().primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/img/avatar.jpg'),
              ),
              const SizedBox(
                height: 10,
              ),
              const titleText(text: 'Lutfi Hakim', textAlign: TextAlign.center),
              Text(
                'lutfihakim@gmail.com',
                style: TextStyle(fontSize: fontSize().regular),
              ),
              Text(
                '+6282586821638',
                style: TextStyle(fontSize: fontSize().regular),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: const Color.fromARGB(255, 246, 245, 245),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 21),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TitleCard(
                        text: 'Pesanan',
                        icon: Bootstrap.clipboard2_check_fill,
                        textLeading: 'Cek riwayat pesanan',
                        iconLeading: Icons.arrow_forward_ios_outlined,
                        onPressed: () =>
                            Get.toNamed(Routes.CEK_RIWAYAT_PESANAN),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Image(
                                image: AssetImage(
                                    'assets/img/pesanan_dalam_proses.png'),
                              ),
                              SizedBox(
                                height: 20,
                                width: 30,
                              ),
                              SizedBox(
                                width: 85, // Adjust this width as needed
                                child: Text(
                                  'Pesanan Dalam Proses',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 11, // Set the font size as needed
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
                                image: AssetImage(
                                    'assets/img/pesanan_dikirim.png'),
                              ),
                              SizedBox(
                                height: 20,
                                width: 30,
                              ),
                              SizedBox(
                                width: 85, // Adjust this width as needed
                                child: Text(
                                  'Pesanan Dikirim',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 11, // Set the font size as needed
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
                                image: AssetImage(
                                    'assets/img/pesanan_diterima.png'),
                              ),
                              SizedBox(
                                height: 20,
                                width: 30,
                              ),
                              SizedBox(
                                width: 85, // Adjust this width as needed
                                child: Text(
                                  'Pesanan Diterima',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 11, // Set the font size as needed
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
                      const SizedBox(
                        height: 30,
                      ),
                      TitleCard(
                        text: 'Ubah Kata sandi',
                        icon: Bootstrap.lock_fill,
                        onPressed: () {
                          Get.toNamed(Routes.UBAH_KATA_SANDI);
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const TitleCard(
                        text: 'Pengaturan alamat',
                        icon: Icons.location_pin,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
