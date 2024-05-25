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

class FillImageCard extends StatelessWidget {
  const FillImageCard({
    super.key,
    this.elevation = 0,
    this.width,
    this.height,
    this.heightImage,
    this.borderRadius = 6,
    this.contentPadding,
    required this.imageProvider,
    this.tags,
    this.title,
    this.description,
    this.footer,
    this.color = Colors.white,
    this.tagSpacing,
    this.tagRunSpacing,
  });

  /// card width
  final double? width;

  /// card height
  final double? height;

  /// image height
  final double? heightImage;

  /// border radius value
  final double borderRadius;

  /// spacing between tag
  final double? tagSpacing;

  /// run spacing between line tag
  final double? tagRunSpacing;

  /// content padding
  final EdgeInsetsGeometry? contentPadding;

  /// image provider
  final ImageProvider imageProvider;

  /// list of widgets
  final List<Widget>? tags;

  /// card color
  final Color color;

  /// widget title of card
  final Widget? title;

  /// widget description of card
  final Widget? description;

  /// widget footer of card
  final Widget? footer;

  final double elevation;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(borderRadius),
      color: color,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: color,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
              ),
              child: Image(
                image: imageProvider,
                width: width,
                height: heightImage,
                fit: BoxFit.cover,
              ),
            ),
            ImageCardContent(
              contentPadding: contentPadding,
              tags: tags,
              title: title,
              footer: footer,
              description: description,
              tagSpacing: tagSpacing,
              tagRunSpacing: tagRunSpacing,
            ),
          ],
        ),
      ),
    );
  }
}

class ImageCardContent extends StatelessWidget {
  const ImageCardContent({
    super.key,
    this.contentPadding,
    this.tags,
    this.title,
    this.description,
    this.footer,
    this.tagSpacing,
    this.tagRunSpacing,
  });

  final EdgeInsetsGeometry? contentPadding;
  final List<Widget>? tags;
  final double? tagSpacing;
  final double? tagRunSpacing;

  final Widget? title;
  final Widget? description;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: contentPadding ??
          const EdgeInsets.only(top: 8, bottom: 12, left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (tags != null)
            Wrap(
              spacing: tagSpacing ?? 12,
              runSpacing: tagRunSpacing ?? 10,
              children: tags!,
            ),
          if (title != null || description != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) title!,
                  if (title != null && description != null)
                    const SizedBox(
                      height: 2,
                    ),
                  if (description != null) description!,
                ],
              ),
            ),
          if (footer != null)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: footer!,
            ),
        ],
      ),
    );
  }
}

// Widget _title({Color? color}) {
//   return Text(
//     'Card title',
//     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: color),
//   );
// }

// Widget _content({Color? color}) {
//   return Text(
//     'This a card description',
//     style: TextStyle(color: color),
//   );
// }

// Widget _footer({Color? color}) {
//   return Row(
//     children: [
//       const CircleAvatar(
//         backgroundImage: AssetImage(
//           'assets/avatar.png',
//         ),
//         radius: 12,
//       ),
//       const SizedBox(
//         width: 4,
//       ),
//       Expanded(
//           child: Text(
//         'Super user',
//         style: TextStyle(color: color),
//       )),
//       IconButton(onPressed: () {}, icon: const Icon(Icons.share))
//     ],
//   );
// }

// Widget _tag(String tag, VoidCallback onPressed) {
//   return InkWell(
//     onTap: onPressed,
//     child: Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(6), color: Colors.green),
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//       child: Text(
//         tag,
//         style: const TextStyle(color: Colors.white),
//       ),
//     ),
//   );
// }
class CartIconWithBadge extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  CartIconWithBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return badges.Badge(
        badgeAnimation: const badges.BadgeAnimation.scale(),
        badgeContent: Text(
          cartController.cartItems.length.toString(),
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
