import 'package:adella_kitchen/app/routes/app_pages.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:adella_kitchen/theme/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    Get.lazyPut(
      () => LoginController(),
    );

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Padding(
          padding: EdgeInsets.only(top: 10),
          child: AppBarTitle(title: 'Selamat Datang Kembali!'),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Form(
            key: _formKey, // Gunakan form key di Form widget
            child: Column(
              children: [
                const subTitle(
                  text:
                      'Masuk kembali ke akunmu, dan nikmati fitur lengkap dari Adella Kitchen',
                ),
                const SizedBox(height: 30),
                TfEmail(controller: _emailController),
                TfPass(
                  controller: _passController,
                  label: 'Password',
                  hint: 'Masukkan Password',
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Lupa kata sandi?',
                    style: TextStyle(
                      color: myColor().primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                BtnPrimary(
                  btnText: 'Login',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print('form valid');
                      controller.login(
                          _emailController.text, _passController.text);
                    }
                  },
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          color: Colors.grey, // Warna garis
                          height: 1, // Tinggi garis
                        ),
                      ),
                      const Text('atau'),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 8),
                          color: Colors.grey, // Warna garis
                          height: 1, // Tinggi garis
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: SignInButton(
                    Buttons.Google,
                    text: 'Masuk Dengan Google',
                    onPressed: () {},
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 140),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Belum memiliki akun? ',
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: 'Daftar',
                          style: TextStyle(
                            color: myColor().primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.offNamed(Routes.REGISTER);
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
