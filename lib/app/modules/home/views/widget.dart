import 'package:flutter/material.dart';

class titleText extends StatelessWidget {
  final String text;

  const titleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff374151)),
    );
  }
}
