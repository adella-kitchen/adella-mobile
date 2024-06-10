import 'package:adella_kitchen/app/routes/app_pages.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import '../controllers/otp_email_controller.dart';

class OtpEmailView extends GetView<OtpEmailController> {
  const OtpEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .start, // Ubah menjadi start agar berada di ujung kiri
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Get.offAllNamed(Routes.VERIF_EMAIL);
                  },
                ),
                const SizedBox(
                    width: 10), // Spasi antara tombol kembali dan teks
                const Text(
                  'Verifikasi Email',
                  style: TextStyle(fontSize: 16), // Ubah ukuran font menjadi 16
                ),
              ],
            ),
            const SizedBox(height: 10), // Tambahkan sedikit spasi antara baris
            const Text(
              'Masukkan kode OTP yang telah dikirimkan ke email Anda',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            Center(
              child: Pinput(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                length: 4,
                showCursor: true,
                onCompleted: (value) {
                  print(value);
                },
                defaultPinTheme: PinTheme(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Belum menerima OTP?',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 25),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: myColor().primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: const Size(350, 40),
                ),
                child: const Text(
                  'Verifikasi',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
                height:
                    20), // Tambahkan sedikit spasi di bagian bawah agar tidak terlalu dekat dengan tombol
          ],
        ),
      ),
    );
  }
}
