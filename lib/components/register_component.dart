import 'package:adella_kitchen/components/partials/single_widget.dart';
import 'package:adella_kitchen/theme/MyColors.dart';
import 'package:adella_kitchen/theme/app_theme.dart';
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
          const TfText(
              label: 'Nama Lengkap',
              placeHolder: 'Masukkan Nama Lengkap',
              validate: 'Name required'),
          const TfEmail(),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Text(
              'Password',
              style: TextStyle(
                  fontSize: fontSize().regular, fontWeight: FontWeight.w500),
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
            Navigator.pushNamed(context, '/login');
          },
          child: Text(
            'Login',
            style: TextStyle(
                color: MyColors().primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
