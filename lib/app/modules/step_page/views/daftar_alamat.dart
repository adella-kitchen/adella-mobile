import 'package:adella_kitchen/app/modules/step_page/controllers/step_page_controller.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DaftarAlamat extends StatelessWidget {
  const DaftarAlamat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StepPageController stepPageController = Get.find<StepPageController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  stepPageController.previousStep();
                },
              ),
              Text(
                'Daftarkan Alamat Kamu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Daftarkan alamat kamu untuk memastikan makanan yang kami kirimkan sampai di rumah kamu.',
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 20),
          Text(
            'Provinsi',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Container(
            width: 350,
            height: 40, // Menambah tinggi agar dropdown lebih luas
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Pilih Provinsi Kamu',
                labelStyle: TextStyle(fontSize: 12),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              items: [],
              onChanged: (String? value) {},
            ),
          ),
          SizedBox(height: 18),
          Text(
            'Kota',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Container(
            width: 350,
            height: 40, // Menambah tinggi agar dropdown lebih luas
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Pilih Kota Kamu',
                labelStyle: TextStyle(fontSize: 12),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              items: [],
              onChanged: (String? value) {},
            ),
          ),
          SizedBox(height: 18),
          Text(
            'Kode Pos',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Container(
            width: 350,
            height: 40, // Menambah tinggi agar dropdown lebih luas
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Masukkan Kode Pos Kamu',
                labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          SizedBox(height: 18),
          Text(
            'Alamat Lengkap',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Container(
            width: 350,
            child: TextFormField(
              maxLines: 6, // Tentukan jumlah maksimum baris yang diinginkan
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: 'Masukkan Alamat Lengkap',
                labelStyle: TextStyle(fontSize: 12, color: Colors.black),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          SizedBox(height: 15), // Tambahkan SizedBox di sini
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: myColor().primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              fixedSize: (Size(350, 40)),
            ),
            child: Text(
              'Konfirmasi',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
