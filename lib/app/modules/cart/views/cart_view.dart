import 'package:adella_kitchen/app/modules/cart/views/empty_view.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CartController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
      ),
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return const EmptyView();
        }
        return ListView.builder(
          itemCount: controller.cartItems.length,
          itemBuilder: (context, index) {
            final item = controller.cartItems[index];
            return ListTile(
              leading: Checkbox(
                activeColor: myColor().primaryColor,
                value: item.isSelected,
                onChanged: (bool? value) {
                  controller.toggleItemSelection(item.id);
                },
              ),
              title: Row(
                children: [
                  Image.network(
                    item.imageUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        'Rp. ${NumberFormat('#,##0', 'id_ID').format(item.price)}',
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        'x ${item.quantity}',
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(
                  Ionicons.trash_outline,
                  color: Colors.red,
                ),
                onPressed: () {
                  controller.removeItem(item.id);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
