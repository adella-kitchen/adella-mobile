import 'package:adella_kitchen/components/login_component.dart';
import 'package:adella_kitchen/layout/card_container_login.dart';
import 'package:adella_kitchen/theme/MyColors.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors().primaryColor,
      body: const Column(
        children: [
          header(judul: 'Login'),
          Expanded(
            child: CardCotainer(
              mainContent: MainContent(),
              judul: 'Selamat Datang Kembali',
            ),
          ),
        ],
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: const Text(
              'Silahkan masukkan email dan password kamu',
              style: TextStyle(fontSize: 14),
            ),
          ),
          const FormLogin(),
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: const footerLogin())
        ],
      ),
    );
  }
}
