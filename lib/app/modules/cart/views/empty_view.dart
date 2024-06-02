import 'package:adella_kitchen/app/routes/app_pages.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Image(
            image: AssetImage('assets/img/empty_cart.png'), width: 130),
        const Text(
          'Keranjang anda kosong',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const Text(
          'Sepertinya anda belum membeli sesuatu',
          style: TextStyle(fontSize: 13),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: myColor().primaryColor,
            ),
            onPressed: () {
              Get.toNamed(Routes.EXPLORE);
            },
            child: const Text(
              'Belanja Sekarang',
              style: TextStyle(color: Colors.white),
            ))
      ],
    ));
  }
}
