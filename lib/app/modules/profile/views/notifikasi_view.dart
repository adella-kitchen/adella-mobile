import 'package:adella_kitchen/app/modules/profile/controllers/notifikasi_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

class NotifikasiView extends GetView<NotifikasiController> {
  const NotifikasiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text(
          'Notifikasi',
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
      body: Container(
        padding: const EdgeInsets.only(top: 30),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.check_circle_outline_rounded,
                      color: Color(0xFFBE3144),
                      size: 45,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  SizedBox(
                    width: 260,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pesanan anda sudah dalam proses pengiriman',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          '1 Juni 2023',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10), // Optional spacing between Row and Divider
              Divider(
                color: Colors.grey, // Color of the underline
                thickness: 1, // Thickness of the underline
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.check_circle_outline_rounded,
                      color: Color(0xFFBE3144),
                      size: 45,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  SizedBox(
                    width: 260,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pesanan anda sudah dalam proses pengiriman',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          '1 Juni 2023',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10), // Optional spacing between Row and Divider
              Divider(
                color: Colors.grey, // Color of the underline
                thickness: 1, // Thickness of the underline
              ),
            ],
          ),
        ),
      ),
    );
  }
}
