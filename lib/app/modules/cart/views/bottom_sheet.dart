import 'package:adella_kitchen/app/modules/cart/controllers/cart_controller.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BottomView extends StatelessWidget {
  final CartController cartController = Get.put(CartController());
  BottomView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Obx(() {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Total'),
                    const SizedBox(width: 6),
                    Text(
                      'Rp. ${NumberFormat('#,##0', 'id_ID').format(cartController.totalHarga.value)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: myColor().primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: myColor().primaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Pesan Sekarang',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          );
        }));
  }
}
