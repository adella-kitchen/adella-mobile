import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class DaftarAkun extends StatelessWidget {
  const DaftarAkun({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Text(
              'Buat Akun',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5), // Optional: Space between text elements
            Text(
              'Masukkan data diri dan daftarkan akunmu untuk menikmati fitur lengkap dari Adella Kitchen',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 35), // Optional: Space between text and TextField
            Container(
              width: 350,
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap Kamu',
                  labelStyle: TextStyle(fontSize: 12), // Custom label text size
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            SizedBox(
                height:
                    20), // Optional: Space between TextField and new TextField
            Container(
              width: 350,
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Alamat Email Kamu',
                  labelStyle: TextStyle(fontSize: 12), // Custom label text size
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
            SizedBox(
                height:
                    20), // Optional: Space between TextField and new TextField
            Container(
              width: 350,
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Kata Sandi',
                  labelStyle: TextStyle(fontSize: 12), // Custom label text size
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            SizedBox(
                height:
                    20), // Optional: Space between TextField and new TextField
            Container(
              width: 350,
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Konfirmasi Kata Sandi',
                  labelStyle: TextStyle(fontSize: 12), // Custom label text size
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            SizedBox(height: 45),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(205, 210, 40, 54),
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
