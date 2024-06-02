
import 'package:adella_kitchen/app/modules/step_page/controllers/step_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class VerifNotelf extends StatelessWidget {
   final StepPageController stepPageController = Get.find<StepPageController>();
   VerifNotelf({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Verifikasi Nomer Telepon',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          const Text(
            'Masukkan kode OTP yang telah dikirimkan ke nomor Anda',
            style: TextStyle(
              fontSize: 14,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 20),
          Pinput(
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

          SizedBox(height: 20),
          Text('Belum menerima OTP??',
          style: TextStyle(fontSize: 14),
          ),

          SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {stepPageController.nextStep();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(205, 210, 40, 54),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fixedSize: Size(350, 40),
              ),
              child: Text(
                'Verifikasi',
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
