import 'package:adella_kitchen/app/modules/profile/views/widget.dart';
import 'package:adella_kitchen/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TambahAlamatSheet extends StatefulWidget {
  const TambahAlamatSheet({super.key});

  @override
  _TambahAlamatSheetState createState() => _TambahAlamatSheetState();
}

class _TambahAlamatSheetState extends State<TambahAlamatSheet> {
  String? selectedProvinsi;
  String? selectedKota;
  String? selectedKodePos;

  final List<String> provinsi = [
    'Jawa Timur',
    'Jawa Tengah',
    'Jawa Barat',
    'DKI Jakarta',
    'Bali',
    // Tambahkan provinsi lainnya sesuai kebutuhan
  ];
  final List<String> kota = [
    'Kota Surabaya',
    'Kota Semarang',
    'Kota Bandung',
    'Kota Jakarta',
    'Kota Denpasar',
    // Tambahkan provinsi lainnya sesuai kebutuhan
  ];
  final List<String> kodePos = [
    '60293',
    '50231',
    '40132',
    '10110',
    '80235',
  ];
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.83,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Tambah Alamat',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                // Container for bottom border with boxShadow effect
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Positioned(
                    left: 0,
                    right: 0,
                    top: 28,
                    child: Container(
                      height: 1, // Border thickness
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1.5, color: const Color(0xFFBFC1C4)),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF6D6D6D).withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Get.back();
                    const Text("Widget ditekan");
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: const Icon(
                      Icons
                          .close, // Anda dapat memilih ikon apa pun yang Anda suka
                      size: 30,
                      // Sesuaikan ukuran sesuai kebutuhan
                    ),
                  ),
                ),

                // Positioned icon at the left edge
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DropDown(
                      labelText: 'Provinsi',
                      hintText: 'Pilih Provinsi',
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedProvinsi = newValue;
                        });
                      },
                      items: provinsi,
                      value: selectedProvinsi,
                    ),
                    DropDown(
                      labelText: 'Kota',
                      hintText: 'Pilih Kota',
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedKota = newValue;
                        });
                      },
                      items: kota,
                      value: selectedKota,
                    ),
                    DropDown(
                      labelText: 'Kode Pos',
                      hintText: 'Masukkan Kode Pos',
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedKodePos = newValue;
                        });
                      },
                      items: kodePos,
                      value: selectedKodePos,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Alamat Lengkap',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFBFC1C4)),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: const TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Masukkan alamat lengkap',
                              hintStyle: TextStyle(fontSize: 16),
                            ),
                            maxLines: 5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    BtnPrimaryProfile(
                      btnText: 'Simpan Alamat',
                      onPressed: () {
                        Get.toNamed(Routes.PENGATURAN_ALAMAT);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
