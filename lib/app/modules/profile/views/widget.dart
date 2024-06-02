import 'package:adella_kitchen/theme/color.dart';
import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final Widget actionButton;
  final String? textLeading;
  final IconData? iconLeading;
  final IconData? iconButton;

  const TitleCard(
      {super.key, // Ubah super.key menjadi Key? key
      required this.text,
      required this.icon,
      required this.actionButton,
      this.textLeading,
      this.iconLeading,
      this.iconButton}); // Panggil superclass constructor dengan parameter key

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: myColor().grey500,
        ),
        const SizedBox(
          width: 7,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        const Spacer(),
        if (textLeading != null)
          Text(
            textLeading!,
            style: TextStyle(fontSize: 11, color: myColor().primaryColor),
          ),
        if (iconLeading != null)
          Icon(
            iconLeading!,
            color: myColor().primaryColor,
            size: 12,
          ),
        if (iconButton != null)
          Icon(
            iconButton,
            color: myColor().grey500,
          )
      ],
    );
  }
}

class RowIcon extends StatelessWidget {
  final String text1, text2, text3;
  final IconData icon1, icon2, icon3;

  const RowIcon(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.icon1,
      required this.icon2,
      required this.icon3});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [Icon(icon1), Text(text1)],
        ),
        Column(
          children: [Icon(icon2), Text(text2)],
        ),
        Column(
          children: [Icon(icon3), Text(text3)],
        )
      ],
    );
  }
}
