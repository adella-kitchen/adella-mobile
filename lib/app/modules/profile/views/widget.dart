import 'package:adella_kitchen/theme/color.dart';
import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final String? textLeading;
  final IconData? iconLeading;
  final IconData? iconButton;

  final VoidCallback? onPressed;

  const TitleCard(
      {super.key, // Ubah super.key menjadi Key? key
      required this.text,
      required this.icon,
      this.textLeading,
      this.iconLeading,
      this.onPressed,
      this.iconButton}); // Panggil superclass constructor dengan parameter key

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
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
              size: 13,
            ),
          if (iconButton != null)
            Icon(
              iconButton,
              color: myColor().grey500,
            )
        ],
      ),
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

class FProfile extends StatelessWidget {
  const FProfile({
    super.key,
    required this.namaController,
    required this.labelText,
    required this.hintText,
  });

  final TextEditingController namaController;
  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            labelText,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                // color: Colors.white,
                ),
            child: TextField(
              controller: namaController,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 17,
                ),
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 106, 113, 136),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class btnPrimaryProfile extends StatelessWidget {
  const btnPrimaryProfile({
    super.key,
    required this.btnText,
  });

  final String btnText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFBE3144),
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                btnText,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
