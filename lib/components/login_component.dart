import 'package:adella_kitchen/components/partials/single_widget.dart';
import 'package:adella_kitchen/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../theme/MyColors.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TfEmail(),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: const Text(
              'Password',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 80,
            child: TextFormField(
              style: TextStyle(fontSize: fontSize().regular),
              obscureText: _obscureText,
              decoration: InputDecoration(
                hintText: 'Masukkan Password',
                hintStyle: const TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(),
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
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                ),
              ),
              cursorColor: Colors.black,
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return 'Password required';
                }
                if (value.length < 8) {
                  return 'Password needs to be at least 8 characters';
                }
                return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: SizedBox(
              height: 50,
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
                    MyColors().primaryColor,
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print('The Form is valid');
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class header extends StatelessWidget {
  final String judul;

  const header({super.key, required this.judul});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 200,
            color: MyColors().primaryColor,
            child: Center(
              child: Text(
                judul,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class footerLogin extends StatelessWidget {
  const footerLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Belum memiliki akun? Silahkan '),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/register');
          },
          child: Text(
            'Register',
            style: TextStyle(
                color: MyColors().primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
