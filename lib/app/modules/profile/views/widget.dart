import 'package:adella_kitchen/theme/color.dart';
import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final String? textLeading;
  final IconData? iconLeading;
  final IconData? iconButton;
  final VoidCallback? onPressed;

  const TitleCard({
    super.key,
    required this.text,
    required this.icon,
    this.textLeading,
    this.iconLeading,
    this.onPressed,
    this.iconButton,
  });

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
              style: const TextStyle(
                  fontSize: 11, color: Color(0xffBE3144)), // Updated color
            ),
          const SizedBox(
            width: 5,
          ),
          if (iconLeading != null)
            Icon(
              iconLeading!,
              color: const Color(0xffBE3144), // Updated color
              size: 13,
            ),
          if (iconButton != null)
            Icon(
              iconButton,
              color: Colors.grey,
            ),
        ],
      ),
    );
  }
}

class RowIcon extends StatelessWidget {
  final String text1, text2, text3;
  final IconData icon1, icon2, icon3;

  const RowIcon({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.icon1,
    required this.icon2,
    required this.icon3,
  });

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
        ),
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
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

class BtnPrimaryProfile extends StatelessWidget {
  const BtnPrimaryProfile({
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

class BarItem extends StatelessWidget {
  final String barText;
  final bool isSelected;
  final VoidCallback onTap;

  const BarItem({
    super.key,
    required this.barText,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                barText,
                style: TextStyle(
                  fontSize: 13,
                  color: isSelected ? const Color(0xffBE3144) : Colors.black,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
              const SizedBox(height: 12),
              if (isSelected)
                Container(
                  height: 2,
                  width: 90,
                  color: const Color(0xffBE3144),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormUbahSandi extends StatelessWidget {
  const FormUbahSandi({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
  });

  final TextEditingController controller;
  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 15,
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
            hintText: hintText,
            hintStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.visibility),
              padding: const EdgeInsets.only(right: 15),
            ),
          ),
        ),
      ],
    );
  }
}
