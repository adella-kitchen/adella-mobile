import 'package:adella_kitchen/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ionicons/ionicons.dart';

class AppBarTitle extends StatelessWidget {
  final String title;

  const AppBarTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold, color: myColor().grey700, fontSize: 23),
    );
  }
}

class subTitle extends StatelessWidget {
  final String text;

  const subTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: myColor().grey500),
    );
  }
}

class TfEmail extends StatelessWidget {
  final TextEditingController controller;
  final void Function()? onTap;

  const TfEmail(
      {super.key, // Perbaiki super.key menjadi Key? key
      required this.controller,
      this.onTap}); // Super harus memiliki key

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: const Text(
            'Email',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 80,
          child: TextFormField(
            controller: controller,
            style: const TextStyle(fontSize: 15),
            decoration: const InputDecoration(
                hintText: 'Masukkan Email',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                prefixIcon: Icon(
                  Ionicons.mail,
                  color: Colors.grey,
                )),
            cursorColor: Colors.black,
            validator: (value) {
              if (value!.trim().isEmpty) {
                return 'Email harus diisi';
              } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value)) {
                return 'Masukkan email yang valid';
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}

class TfSearch extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final void Function()? onTap;
  final BorderSide borderSide;

  const TfSearch({super.key, required this.hint, required this.controller, required this.borderSide, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 15, color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: borderSide
          ),
          prefixIcon: const Icon(
            Ionicons.search,
            color: Colors.grey,
          ),
        ),
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        onTap: onTap,
      ),
    );
  }
}

class TfText extends StatelessWidget {
  final String label;
  final String placeHolder;
  final String validate;
  final TextEditingController controller;
  final void Function()? onTap;

  const TfText(
      {super.key,
      required this.label,
      required this.placeHolder,
      required this.validate,
      required this.controller,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: Text(
            label,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 80,
          child: TextFormField(
            controller: controller,
            style: const TextStyle(fontSize: 15),
            decoration: InputDecoration(
              hintText: placeHolder,
              hintStyle: const TextStyle(color: Colors.grey),
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(
                Ionicons.person_circle,
                color: Colors.grey,
              ),
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
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}

class TfPass extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final void Function()? onTap;

  const TfPass(
      {super.key,
      required this.controller,
      required this.label,
      required this.hint,
      this.onTap});

  @override
  _TfPassState createState() => _TfPassState();
}

class _TfPassState extends State<TfPass> {
  bool _obscureText = true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 80,
          child: TextFormField(
            controller: widget.controller,
            style: const TextStyle(fontSize: 15),
            obscureText: _obscureText,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: const TextStyle(color: Colors.grey),
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(
                Ionicons.lock_closed,
                color: Colors.grey,
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Ionicons.eye_off : Ionicons.eye,
                  color: Colors.grey,
                ),
              ),
            ),
            cursorColor: Colors.black,
            validator: (value) {
              if (value!.trim().isEmpty) {
                return 'Password harus diisi';
              }
              if (value.length < 8) {
                return 'Password minimal 8 karakter';
              }
              return null;
            },
            onTap: widget.onTap,
          ),
        ),
      ],
    );
  }
}

class BtnPrimary extends StatelessWidget {
  final String btnText;
  final VoidCallback? onPressed;

  const BtnPrimary({super.key, required this.btnText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            minimumSize: MaterialStateProperty.all(
              const Size(double.infinity, 50),
            ),
            backgroundColor: MaterialStateProperty.all(
              myColor().primaryColor,
            ),
          ),
          onPressed: onPressed,
          child: Text(
            btnText,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class BtnLogin extends StatelessWidget {
  final String btnText;
  final VoidCallback? onPressed;
  final bool isLoading; // Tambahkan properti isLoading

  const BtnLogin({
    super.key,
    required this.btnText,
    required this.onPressed,
    required this.isLoading, // Tambahkan isLoading
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Stack(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(
                  const Size(double.infinity, 50),
                ),
                backgroundColor: MaterialStateProperty.all(
                  myColor().primaryColor,
                ),
              ),
              onPressed: isLoading
                  ? null
                  : onPressed, // Disable tombol saat isLoading true
              child: Text(
                btnText,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (isLoading) // Tampilkan indikator loading jika isLoading true
              const Positioned.fill(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CustomSnackBar {
  static void showSuccess(
    String title,
    String desc,
  ) {
    Get.snackbar(
      title,
      desc,
      icon: const Icon(Ionicons.checkmark_circle_outline),
      leftBarIndicatorColor: const Color(0xff198754),
      duration: const Duration(seconds: 2),
    );
  }

  static void showWarning(
    String title,
    String desc,
  ) {
    Get.snackbar(title, desc,
        icon: const Icon(Ionicons.warning),
        leftBarIndicatorColor: const Color(0xffffc107),
        duration: const Duration(seconds: 2));
  }

  static void showError(
    String title,
    String desc,
  ) {
    Get.snackbar(title, desc,
        icon: const Icon(Ionicons.bug),
          leftBarIndicatorColor: const Color(0xffdc3545),
          duration: const Duration(seconds: 2));
  }
}
