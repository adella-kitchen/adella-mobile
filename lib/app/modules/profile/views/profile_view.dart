import 'package:adella_kitchen/app/modules/home/views/widget.dart';
import 'package:adella_kitchen/app/modules/profile/views/widget.dart';
import 'package:adella_kitchen/theme/app_theme.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:adella_kitchen/theme/widget/app_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
        backgroundColor: myColor().primaryColor,
      ),
      body: Padding(
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
              const SizedBox(
                height: 20,
              ),
              Container(
                color: const Color.fromARGB(255, 246, 245, 245),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 21),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TitleCard(
                        text: 'Pesanan',
                        icon: Bootstrap.clipboard2_check_fill,
                        textLeading: 'Cek riwayat pesanan',
                        iconLeading: Icons.arrow_forward_ios_outlined,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TitleCard(
                        text: 'Pengaturan Akun',
                        icon: Bootstrap.person_fill,
                        iconButton: Icons.arrow_forward_ios_outlined,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TitleCard(
                        text: 'Pesanan',
                        icon: Bootstrap.cart_check_fill,
                        textLeading: 'Cek riwayat transaksi',
                        iconLeading: Icons.arrow_forward_ios_outlined,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TitleCard(
                        text: 'Pengaturan alamat',
                        icon: Bootstrap.geo_alt_fill,
                        iconButton: Icons.arrow_forward_ios_outlined,
                      )
                    ],
                  ),
                ),
              ),
              BtnPrimary(
                btnText: 'Logout',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
