import 'package:adella_kitchen/components/login_component.dart';
import 'package:adella_kitchen/components/register_component.dart';
import 'package:adella_kitchen/layout/card_container_login.dart';
import 'package:adella_kitchen/theme/myColors.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColors().primaryColor,
      body: const Column(
        children: [
          header(judul: 'Register'),
          Expanded(
            child: CardCotainer(
              mainContent: MainContent(),
              judul: 'Selamat datang',
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
              'Silahkan Daftarkan email dan password kamu',
              style: TextStyle(fontSize: 14),
            ),
          ),
          const FormRegister(),
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: const footerRegister())
        ],
      ),
    );
  }
}
