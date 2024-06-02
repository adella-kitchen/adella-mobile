import 'package:adella_kitchen/app/modules/step_page/controllers/step_page_controller.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:adella_kitchen/theme/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaftarAkun extends StatelessWidget {
  final StepPageController stepPageController = Get.find<StepPageController>();

  // Controllers for each TextField
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  DaftarAkun({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Buat Akun',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.left),

          SizedBox(height: 5), // Optional: Space between text elements
          Text(
            'Masukkan data diri dan daftarkan akunmu untuk menikmati fitur lengkap dari Adella Kitchen',
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 35), // Optional: Space between text and TextField
          Container(
            width: 350,
            height: 40,
            child: TextField(
              controller: namaController,
              decoration: InputDecoration(
                labelText: 'Nama Lengkap Kamu',
                labelStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.black), // Custom label text size
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(5),
                ),
                prefixIcon: Icon(Icons.person),
              ),
            ),
          ),
          SizedBox(
              height:
                  20), // Optional: Space between TextField and new TextField
          Container(
            width: 350,
            height: 40,
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Alamat Email Kamu',
                labelStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.black), // Custom label text size
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(5),
                ),
                prefixIcon: Icon(Icons.email),
              ),
            ),
          ),
          SizedBox(
              height:
                  20), // Optional: Space between TextField and new TextField
          Container(
            width: 350,
            height: 40,
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Kata Sandi',
                labelStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.black), // Custom label text size
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(5),
                ),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true, // To hide the password text
            ),
          ),
          SizedBox(
              height:
                  20), // Optional: Space between TextField and new TextField
          Container(
            width: 350,
            height: 40,
            child: TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Konfirmasi Kata Sandi',
                labelStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.black), // Custom label text size
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(5),
                ),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true, // To hide the password text
            ),
          ),
          SizedBox(height: 45),
          ElevatedButton(
            onPressed: () {
              // Check if any field is empty
              if (namaController.text.isEmpty ||
                  emailController.text.isEmpty ||
                  passwordController.text.isEmpty ||
                  confirmPasswordController.text.isEmpty) {
                CustomSnackBar.showWarning(
                    'Peringatan', 'Semua kolom harus diisi');
              } else {
                stepPageController.nextStep();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: myColor().primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              fixedSize: Size(350, 40),
            ),
            child: Text(
              'Daftar',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
