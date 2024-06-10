import 'package:adella_kitchen/app/modules/cart/controllers/cart_controller.dart';
import 'package:adella_kitchen/app/routes/app_pages.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class titleText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;

  const titleText({super.key, required this.text, required this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text,
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: myColor().grey700),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const CategoryItem({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(right: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(color: Colors.grey), // Tambahkan border abu-abu
              ),
              child: Icon(
                icon,
                color:
                    myColor().primaryColor, // Ubah warna ikon sesuai kebutuhan
              ),
            ),
            const SizedBox(height: 4),
            Text(
              text,
              style: const TextStyle(fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryRow extends StatelessWidget {
  final List<CategoryItemData> categories;

  const CategoryRow({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryItem(
            text: category.text,
            icon: category.icon,
            onPressed: category.onPressed,
          );
        },
      ),
    );
  }
}

class CategoryItemData {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  CategoryItemData({
    required this.text,
    required this.icon,
    required this.onPressed,
  });
}

class CartIconWithBadge extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  CartIconWithBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final itemCount = cartController.cartItems.length;
      return badges.Badge(
        showBadge: itemCount > 0,
        badgeAnimation: const badges.BadgeAnimation.scale(),
        badgeContent: Text(
          itemCount.toString(),
          style: const TextStyle(
              color: Color(0xFFDC495C), fontWeight: FontWeight.bold),
        ),
        badgeStyle: const badges.BadgeStyle(badgeColor: Colors.white),
        position: badges.BadgePosition.topEnd(top: -10, end: -10),
        child: Material(
          color: const Color(0xFFDC495C),
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: () => Get.toNamed(Routes.CART),
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
      );
    });
  }
}


