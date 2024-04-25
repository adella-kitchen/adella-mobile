import 'package:adella_kitchen/app/modules/home/views/data_img.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class titleText extends StatelessWidget {
  final String text;

  const titleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
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
