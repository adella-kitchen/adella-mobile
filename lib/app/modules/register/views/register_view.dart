import 'package:adella_kitchen/app/routes/app_pages.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:adella_kitchen/theme/widget/app_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController validPassController = TextEditingController();

    String? confirmPasswordValidator(String? value) {
      if (value == null || value.isEmpty) {
        return 'Konfirmasi Password harus diisi';
      }
      if (value != passController.text) {
        return 'Password dan Konfirmasi Password harus sama';
      }
      return null;
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Padding(
          padding: EdgeInsets.only(top: 10),
          child: AppBarTitle(title: 'Buat Akun!'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const subTitle(
                  text:
                      'Masukkan data diri dan daftarkan akunmu untuk menikmati fitur lengkap dari Adella Kitchen!',
                ),
                const SizedBox(height: 30),
                TfText(
                  label: 'Nama',
                  placeHolder: 'Masukkan nama anda',
                  validate: 'Nama harus diisi',
                  controller: nameController,
                ),
                TfEmail(controller: emailController),
                TfPassConfirm(
                    controller: passController,
                    label: 'Password',
                    hint: 'Password',
                    validator: confirmPasswordValidator),
                TfPassConfirm(
                    controller: validPassController,
                    label: 'Konfirmasi Password',
                    hint: 'Konfirmasi Password',
                    validator: confirmPasswordValidator),
                BtnLogin(
                    btnText: 'Daftar Akun',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        print('form valid');
                        controller.isLoading.value = true;
                        controller.register(nameController.text,
                            emailController.text, passController.text);
                      }
                    },
                    isLoading: controller.isLoading),
                Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Sudah memiliki akun? Silahkan ',
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
                              Get.offNamed(Routes.LOGIN);
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
