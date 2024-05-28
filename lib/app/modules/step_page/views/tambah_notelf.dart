import 'package:adella_kitchen/app/modules/step_page/controllers/step_page_controller.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:adella_kitchen/theme/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class NomerTelfon extends StatelessWidget {
  final StepPageController stepPageController = Get.find<StepPageController>();
  final TextEditingController phoneController = TextEditingController();

  NomerTelfon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tambahkan Nomer Telepon',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Check out lebih cepat dan aman. Nomor ponsel Anda akan digunakan untuk mengamankan informasi pembayaran Anda dengan Belanja Bayar',
            style: TextStyle(
              fontSize: 15,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 35), // Opsional: Jarak antara teks dan TextField
          Container(
            width: 350,
            height: 40,
            child: TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ], // Mengubah keyboard untuk input nomor telepon
              decoration: InputDecoration(
                labelText: 'Nomor Telepon atau WhatsApp Kamu',
                labelStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.black), // Ukuran teks label kustom
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(5),
                ),
                prefixIcon:
                    Icon(Icons.phone), // Mengganti ikon dengan ikon telepon
              ),
            ),
          ),
          SizedBox(height: 4),
          Container(
            child: Text(
              'Kode verifikasi akan dikirimkan ke nomor telepon Anda',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
          SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              if (phoneController.text.isEmpty) {
                CustomSnackBar.showWarning(
                    'Peringatan', 'Semua kolom harus diisi');
              } else {
                stepPageController.nextStep();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: myColor().primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              fixedSize: Size(350, 40),
            ),
            child: Text(
              'Selanjutnya',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
