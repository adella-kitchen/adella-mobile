import 'package:flutter/material.dart';

// Kelas untuk mengatur tema aplikasi
class AppTheme {
  // Fungsi untuk mengembalikan tema aplikasi
  static ThemeData getAppTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      useMaterial3: true,
      // Konfigurasi font default
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontFamily: 'Poppins'),
        bodyLarge: TextStyle(fontFamily: 'Poppins'),
        bodyMedium: TextStyle(fontFamily: 'Poppins'),
      ),
    );
  }
}

class fontSize {
  final double regular = 14;
  final double medium = 18;
}
