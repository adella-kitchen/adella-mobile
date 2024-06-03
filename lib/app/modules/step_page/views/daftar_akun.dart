import 'package:adella_kitchen/app/modules/step_page/controllers/step_page_controller.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaftarAkun extends StatefulWidget {
  DaftarAkun({Key? key}) : super(key: key);

  @override
  _DaftarAkunState createState() => _DaftarAkunState();
}

class _DaftarAkunState extends State<DaftarAkun> {
  final StepPageController stepPageController = Get.find<StepPageController>();

  // Controllers for each TextField
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Method untuk mereset showError dan errorMessage
  void resetError() {
    setState(() {
      showErrorNama = false;
      showErrorEmail = false;
      showErrorPassword = false;
      showErrorConfirmPassword = false;
    });
  }

  bool showErrorNama = false;
  bool showErrorEmail = false;
  bool showErrorPassword = false;
  bool showErrorConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Buat Akun',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 5),
            Text(
              'Masukkan data diri dan daftarkan akunmu untuk menikmati fitur lengkap dari Adella Kitchen',
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 35),
            Container(
              width: 350,
              child: TextFormField(
                controller: namaController,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap Kamu',
                  labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  prefixIcon: Icon(Icons.person),
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    setState(() {
                      showErrorNama = true;
                    });
                    return 'Nama lengkap tidak boleh kosong';
                  }
                  return null;
                },
                onChanged: (value) {
                  resetError(); // Panggil method resetError saat teks diubah
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Alamat Email Kamu',
                  labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  prefixIcon: Icon(Icons.email),
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    setState(() {
                      showErrorEmail = true;
                    });
                    return 'Email tidak boleh kosong';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    setState(() {
                      showErrorEmail = true;
                    });
                    return 'Masukkan email yang valid';
                  }
                  return null;
                },
                onChanged: (value) {
                  resetError(); // Panggil method resetError saat teks diubah
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Kata Sandi',
                  labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    setState(() {
                      showErrorPassword = true;
                    });
                    return 'Kata sandi tidak boleh kosong';
                  }
                  if (value.length < 6) {
                    setState(() {
                      showErrorPassword = true;
                    });
                    return 'Kata sandi harus minimal 6 karakter';
                  }
                  return null;
                },
                onChanged: (value) {
                  resetError(); // Panggil method resetError saat teks diubah
                },
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              child: TextFormField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Konfirmasi Kata Sandi',
                  labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    setState(() {
                      showErrorConfirmPassword = true;
                    });
                    return 'Konfirmasi kata sandi tidak boleh kosong';
                  }
                  if (value != passwordController.text) {
                    setState(() {
                      showErrorConfirmPassword = true;
                    });
                    return 'Kata sandi tidak cocok';
                  }
                  return null;
                },
                onChanged: (value) {
                  resetError(); // Panggil method resetError saat teks diubah
                },
              ),
            ),
            SizedBox(height: 45),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  stepPageController.nextStep();
                } else {
                  // Set showError berdasarkan kondisi validasi
                  setState(() {
                    showErrorNama = namaController.text.isEmpty;
                    showErrorEmail = emailController.text.isEmpty ||
                        !RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(emailController.text);
                    showErrorPassword = passwordController.text.isEmpty ||
                        passwordController.text.length < 6;
                    showErrorConfirmPassword =
                        confirmPasswordController.text.isEmpty ||
                            confirmPasswordController.text !=
                                passwordController.text;
                  });
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
      ),
    );
  }
}
