import 'package:adella_kitchen/components/login_component.dart';
import 'package:adella_kitchen/theme/myColors.dart';
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
      backgroundColor: myColors().primaryColor,
      body: const Column(
        children: [
          header(),
          Expanded(
            child: cardContainer(),
          ),
        ],
      ),
    );
  }
}

class cardContainer extends StatelessWidget {
  const cardContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 4,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      )),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: const Text(
                  'Selamat Datang Kembali',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
              ),
              const mainContent(),
            ],
          ),
        ),
      ),
    );
  }
}

class mainContent extends StatelessWidget {
  const mainContent({super.key});
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
              margin: const EdgeInsets.only(top: 10), child: const footer())
        ],
      ),
    );
  }
}
