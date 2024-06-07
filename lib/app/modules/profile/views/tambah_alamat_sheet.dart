import 'package:adella_kitchen/app/modules/profile/views/widget.dart';
import 'package:adella_kitchen/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
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
      heightFactor: 0.8,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Container untuk teks dengan garis bawah
                Container(
                  padding: const EdgeInsets.only(
                      bottom:
                          18), // Padding agar garis bawah tidak bertabrakan dengan ikon
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tambah Alamat',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                // Container untuk border bawah dengan efek boxShadow
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 4,
                  child: Container(
                    height: 1, // Ketebalan border bawah
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 4,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                  ),
                ),
                // Container untuk ikon
                Positioned(
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 5, right: 9, bottom: 9), // Sesuaikan padding ikon
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Color(0xFF6D6D6D), width: 2),
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
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
                            maxLines: 4,
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
