import 'package:adella_kitchen/app/modules/profile/controllers/pengaturan_akun_controller.dart';
import 'package:adella_kitchen/app/modules/profile/views/widget.dart';
// import 'package:adella_kitchen/theme/color.dart';
// import 'package:adella_kitchen/theme/widget/app_widget.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PengaturanAkunView extends StatelessWidget {
  final PengaturanAkunController stepPageController =
      Get.find<PengaturanAkunController>();

  final TextEditingController namaController = TextEditingController();
  final TextEditingController notelpController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  PengaturanAkunView({super.key});

  // PengaturanAkunView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text(
          'Informasi Profil',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/img/avatar.jpg'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xFFDC495C),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              FProfile(
                  labelText: 'Nama Lengkap',
                  hintText: 'isi nama lengkap',
                  namaController: namaController),
              FProfile(
                  labelText: 'No Telpon',
                  hintText: 'Isi no telpon',
                  namaController: notelpController),
              FProfile(
                  labelText: 'Email',
                  hintText: 'isi email',
                  namaController: emailController),
              const SizedBox(height: 50),
              const BtnPrimaryProfile(btnText: 'Edit Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
