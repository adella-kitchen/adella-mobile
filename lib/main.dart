import 'package:adella_kitchen/components/partials/navbar.dart';
import 'package:adella_kitchen/view/home.dart';
import 'package:adella_kitchen/view/login.dart';
import 'package:adella_kitchen/view/register.dart';
import 'package:adella_kitchen/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:adella_kitchen/theme/app_theme.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adella Kitchen',
      theme: AppTheme.getAppTheme(),
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/home': (context) => const Home(),
        '/nav': (context) => const Navbar(),
      },
      initialRoute: '/nav',
    );
  }
}
