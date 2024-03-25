import 'package:flutter/material.dart';

import '../theme/myColors.dart';

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
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: const Text(
              'Email',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          TextFormField(
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
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: const Text(
              'Password',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          TextFormField(
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
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(
                    const Size(double.infinity, 50),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    myColors().primaryColor,
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
  const header({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 200,
            color: myColors().primaryColor,
            child: const Center(
              child: Text(
                'Login',
                style: TextStyle(
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

class footer extends StatelessWidget {
  const footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Belum memiliki akun? Silahkan '),
        GestureDetector(
          onTap: () {
            print('Text daftar di klik');
          },
          child: Text(
            'Daftar',
            style: TextStyle(
                color: myColors().primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
