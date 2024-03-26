import 'package:adella_kitchen/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TfText extends StatelessWidget {
  final String label;
  final String placeHolder;
  final String validate;

  const TfText(
      {super.key,
      required this.label,
      required this.placeHolder,
      required this.validate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: Text(
            label,
            style: TextStyle(
                fontSize: fontSize().regular, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 80,
          child: TextFormField(
            style: TextStyle(fontSize: fontSize().regular),
            decoration: InputDecoration(
              hintText: placeHolder,
              hintStyle: const TextStyle(color: Colors.grey),
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            cursorColor: Colors.black,
            validator: (value) {
              if (value!.trim().isEmpty) {
                return validate;
              }
              return null;
            },
            keyboardType: TextInputType.text,
          ),
        ),
      ],
    );
  }
}

class TfEmail extends StatelessWidget {
  const TfEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: Text(
            'Email',
            style: TextStyle(
                fontSize: fontSize().regular, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 80,
          child: TextFormField(
            style: TextStyle(fontSize: fontSize().regular),
            decoration: const InputDecoration(
              hintText: 'Masukkan Email',
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            cursorColor: Colors.black,
            validator: (value) {
              if (value!.trim().isEmpty) {
                return 'Email required';
              } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      ],
    );
  }
}
