import 'package:adella_kitchen/view/login.dart';
import 'package:adella_kitchen/view/register.dart';
import 'package:adella_kitchen/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:adella_kitchen/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adella Kitchen',
      theme: AppTheme.getAppTheme(),
      routes: {
        // Rute awal, menampilkan SplashScreen
        '/': (context) => const SplashScreen(),
        // Rute untuk halaman login
        '/login': (context) => const Login(),
        // Rute untuk halaman register
        '/register': (context) => const Register(),
      },
      initialRoute: '/login',
    );
  }
}
