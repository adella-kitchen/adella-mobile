import 'package:adella_kitchen/theme/myColors.dart';
import 'package:flutter/material.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({Key? key}) : super(key: key);

  @override
  _FormRegisterState createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
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
              'Nama Lengkap',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Masukkan Nama Lengkap',
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
            cursorColor: Colors.black,
            validator: (value) {
              if (value!.trim().isEmpty) {
                return 'Name required';
              }
              return null;
            },
            keyboardType: TextInputType.text,
          ),
          Container(
            margin: const EdgeInsets.only(top: 7, bottom: 5),
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
                  'Register',
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

class footerRegister extends StatelessWidget {
  const footerRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Sudah memiliki akun? Silahkan '),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
          child: Text(
            'Login',
            style: TextStyle(
                color: myColors().primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
