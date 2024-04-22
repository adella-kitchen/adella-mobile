import 'package:adella_kitchen/app/modules/home/views/widget.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:adella_kitchen/theme/widget/app_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  TextEditingController searchController = TextEditingController();

  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());

    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          color: myColor().primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Alamat',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      DropdownButton<String>(
                        value: controller.selectedAddress.value,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            print('New value selected: $newValue');
                            controller.selectedAddress.value = newValue;
                            print(
                                'Selected address: ${controller.selectedAddress.value}');
                            controller.update();
                          }
                        },
                        items: <String>[
                          'Jl. Jalan, Jawa Timur',
                          'Jl. Kenangan Jawa Timur',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  value,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Material(
                    borderRadius: BorderRadius.circular(
                        10.0), // Atur nilai border radius sesuai keinginan Anda
                    color: const Color(0xFFDC495C),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(
                          10.0), // Sama dengan nilai border radius di Material
                      onTap: () {
                        // Tambahkan aksi yang ingin dilakukan saat tombol ditekan
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: const Icon(
                          Ionicons.cart,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 13),
              TfSearch(hint: 'Cari Menu', controller: searchController)
            ],
          ),
        ),
        //main content
        const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [titleText(text: 'Kategori')],
          ),
        ),
      ],
    ));
  }
}
