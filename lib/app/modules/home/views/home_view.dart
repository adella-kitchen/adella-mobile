import 'package:adella_kitchen/app/modules/home/views/widget.dart';
import 'package:adella_kitchen/theme/app_theme.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:adella_kitchen/theme/widget/app_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';
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
          decoration: BoxDecoration(
            color: myColor().primaryColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat berbelanja 👋',
                        style: TextStyle(
                            fontSize: fontSize().regular, color: Colors.white),
                      ),
                      Text(
                        'Lutfi Hakim',
                        style: TextStyle(
                          fontSize: fontSize().medium,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Material(
                    color: const Color(0xFFDC495C),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        // Tambahkan aksi yang ingin dilakukan saat tombol ditekan
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 13),
              TfSearch(hint: 'Cari Menu Makanan', controller: searchController),
              const SizedBox(height: 10),
            ],
          ),
        ),

        //main content
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const titleText(text: 'Kategori'),
              const SizedBox(height: 10),
              CategoryRow(categories: [
                CategoryItemData(
                    text: 'Makanan',
                    icon: BoxIcons.bxs_bowl_rice,
                    onPressed: () {}),
                CategoryItemData(
                    text: 'Minuman',
                    icon: BoxIcons.bxs_coffee,
                    onPressed: () {}),
                CategoryItemData(
                    text: 'Catering',
                    icon: BoxIcons.bxs_dish,
                    onPressed: () {}),
                CategoryItemData(
                    text: 'Kotakan', icon: BoxIcons.bxs_box, onPressed: () {}),
                CategoryItemData(
                    text: 'Frozen',
                    icon: BoxIcons.bxs_fridge,
                    onPressed: () {}),
              ]),
              const Padding(
                padding: EdgeInsets.only(top: 15, bottom: 10),
                child: titleText(text: 'Promo'),
              )
              
            ],
          ),
        ),
      ],
    ));
  }
}
