import 'package:adella_kitchen/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/verif_email_controller.dart';

class VerifEmailView extends GetView<VerifEmailController> {
  const VerifEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Menambahkan padding secara keseluruhan
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Mengatur alignment dari column utama
            children: [
              SizedBox(height: 50), // Memberikan jarak dari atas layar
              const Text(
                'Verifikasi Email',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10), // Memberikan jarak antara judul dan teks
              const Text(
                'Harap masukkan alamat email Anda untuk mendapatkan kode verifikasi.',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.left, // Mengatur alignment teks
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email Anda',
                  labelStyle: TextStyle(color: Colors.grey), // Warna label default
                  floatingLabelStyle: TextStyle(color: Colors.black), // Warna label saat fokus
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Masukkan email yang valid';
                  }
                  return null;
                },
              ),
              SizedBox(height: 5),
              const Text(
                'Kode verifikasi akan dikirimkan ke email Anda',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 20), // Memberikan jarak sebelum ElevatedButton
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Get.toNamed(Routes.OTP_EMAIL);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(218, 176, 16, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: Size(475, 40),
                ),
                child: const Text(
                  'Kirim Kode Verifikasi',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
