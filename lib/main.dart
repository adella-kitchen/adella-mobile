import 'package:adella_kitchen/view/login.dart';
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
      home: const Login(),
    );
  }
}
