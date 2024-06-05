import 'package:adella_kitchen/app/modules/profile/views/widget.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CekRiwayatPesananView extends StatefulWidget {
  const CekRiwayatPesananView({super.key});
  @override
  CekRiwayatPesananViewState createState() => CekRiwayatPesananViewState();
}

class CekRiwayatPesananViewState extends State<CekRiwayatPesananView> {
  int selectedIndex = 0; // Track the selected index
  final List<String> barItems = [
    'Pesanan Dalam Proses',
    'Pesanan Dikirim',
    'Pesanan Diterima'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          'Riwayat Pesanan',
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
      body: Center(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  barItems.length,
                  (index) => BarItem(
                    barText: barItems[index],
                    isSelected: selectedIndex == index,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
