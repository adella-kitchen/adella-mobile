import 'package:adella_kitchen/app/modules/cart/views/bottom_sheet.dart';
import 'package:adella_kitchen/app/modules/cart/views/empty_view.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:input_quantity/input_quantity.dart';
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
        actions: [
          Obx(() {
            if (controller.isAnyItemSelected) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: TextButton(
                  child: Text(
                    'Hapus',
                    style: TextStyle(color: myColor().primaryColor),
                  ),
                  onPressed: () {
                    controller.removeSelectedItems();
                  },
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          })
        ],
        title: const Text(
          'Keranjang',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.cartItems.isEmpty) {
            return const EmptyView();
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: ListView.builder(
              itemCount: controller.cartItems.length,
              itemBuilder: (context, index) {
                final item = controller.cartItems[index];
                return ListTile(
                  onTap: () {
                    print('Item with id ${item.id} clicked');
                  },
                  contentPadding: const EdgeInsets.only(
                      right: 12, left: 2, top: 12, bottom: 12),
                  leading: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: Checkbox(
                      activeColor: myColor().primaryColor,
                      value: item.isSelected,
                      onChanged: (bool? value) {
                        controller.toggleItemSelection(item.id);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
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
                          SizedBox(
                            width: 120,
                            child: Text(
                              item.name,
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            child: Text(
                              'Tambahan jfakfajsasaskfasfasafksafk',
                              // 'x ${item.quantity}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 12, color: myColor().grey500),
                            ),
                          ),
                          Text(
                            'Rp. ${NumberFormat('#,##0', 'id_ID').format(item.price * item.quantity)}',
                            style: TextStyle(
                                fontSize: 15,
                                color: myColor().primaryColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: InputQty(
                      decoration: QtyDecorationProps(
                          isBordered: false,
                          borderShape: BorderShapeBtn.circle,
                          btnColor: myColor().primaryColor,
                          width: 8),
                      steps: 1,
                      initVal: item.quantity,
                      minVal: 1,
                      onQtyChanged: (value) {
                        print('Value received: $value'); // Debugging
                        print(
                            'Type of value: ${value.runtimeType}'); // Debugging
                        controller.updateQuantity(item.id, value.toInt());
                      }),
                );
              },
            ),
          );
        }),
      ),
      bottomSheet: BottomView(),
    );
  }
}
