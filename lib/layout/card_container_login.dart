import 'package:flutter/material.dart';

class CardCotainer extends StatelessWidget {
  final Widget mainContent;
  final String judul;

  const CardCotainer(
      {super.key, required this.mainContent, required this.judul});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 4,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      )),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Text(
                  judul,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 20),
                ),
              ),
              mainContent
            ],
          ),
        ),
      ),
    );
  }
}
