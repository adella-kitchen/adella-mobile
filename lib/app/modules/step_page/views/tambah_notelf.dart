import 'package:adella_kitchen/app/modules/step_page/controllers/step_page_controller.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NomerTelfon extends StatefulWidget {
  NomerTelfon({Key? key}) : super(key: key);

  @override
  _NomerTelfonState createState() => _NomerTelfonState();
}

class _NomerTelfonState extends State<NomerTelfon> {
  final StepPageController stepPageController = Get.find<StepPageController>();
  final TextEditingController phoneController = TextEditingController();
  bool showError = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showError = false;
          errorMessage = '';
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tambahkan Nomor Telepon',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Check out lebih cepat dan aman. Nomor ponsel Anda akan digunakan untuk mengamankan informasi pembayaran Anda dengan Belanja Bayar',
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 35),
            Container(
              width: 350,
              height: 40,
              child: TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  labelText: 'Nomor Telepon atau WhatsApp Kamu',
                  labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  prefixIcon: Icon(Icons.phone),
                ),
                onChanged: (value) {
                  setState(() {
                    showError = false;
                    errorMessage = '';
                  });
                },
              ),
            ),
            if (showError)
              Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 4.0),
                child: Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            SizedBox(height: 4),
            Text(
              'Kode verifikasi akan dikirimkan ke nomor telepon Anda',
              style: TextStyle(fontSize: 10),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                String phone = phoneController.text;
                if (phone.isEmpty) {
                  setState(() {
                    showError = true;
                    errorMessage = 'Nomor telepon tidak boleh kosong';
                  });
                } else if (!RegExp(r'^[0-9]+$').hasMatch(phone)) {
                  setState(() {
                    showError = true;
                    errorMessage = 'Masukkan nomor telepon yang valid';
                  });
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
      ),
    );
  }
}
