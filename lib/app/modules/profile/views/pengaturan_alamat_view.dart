import 'package:adella_kitchen/app/modules/profile/views/tambah_alamat_sheet.dart';
import 'package:adella_kitchen/app/modules/profile/views/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PengaturanAlamatView extends StatefulWidget {
  const PengaturanAlamatView({super.key});

  @override
  PengaturanAlamatViewState createState() => PengaturanAlamatViewState();
}

class PengaturanAlamatViewState extends State<PengaturanAlamatView> {
  int? selectedValue;

  void _onEditPressed() {
    // Logika yang dijalankan saat teks "edit" ditekan
    const Text("Edit button pressed");
    // Tambahkan logika Anda di sini, misalnya navigasi ke halaman edit alamat
  }

  void _showTambahAlamatSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return const TambahAlamatSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text(
          'Pengaturan Alamat',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            RadibtnProfile(
                value: 1,
                selectedValue: selectedValue,
                onChanged: (int? value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                labelAlamat: 'Jl.Mt Hariyono No.54, Mangunharjo, Mayangan',
                labelKota: 'Kota Probolinggo',
                labelKodePos: 'Jawa Timur 67217',
                onEditPressed: _onEditPressed),
            const SizedBox(
              height: 20,
            ),
            RadibtnProfile(
                value: 2,
                selectedValue: selectedValue,
                onChanged: (int? value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                labelAlamat: 'Jl.Mt Hariyono No.54, Mangunharjo, Mayangan',
                labelKota: 'Kota Probolinggo',
                labelKodePos: 'Jawa Timur 67217',
                onEditPressed: _onEditPressed),
            const SizedBox(
              height: 20,
            ),
            RadibtnProfile(
                value: 3,
                selectedValue: selectedValue,
                onChanged: (int? value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                labelAlamat: 'Jl.Mt Hariyono No.54, Mangunharjo, Mayangan',
                labelKota: 'Kota Probolinggo',
                labelKodePos: 'Jawa Timur 67217',
                onEditPressed: _onEditPressed),
            const SizedBox(
              height: 50,
            ),
            btnTambahAlamat(onTambahPressed: _showTambahAlamatSheet)
          ],
        ),
      ),
    );
  }
}
