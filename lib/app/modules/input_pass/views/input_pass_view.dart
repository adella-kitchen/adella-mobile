import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/input_pass_controller.dart';

class InputPassView extends GetView<InputPassController> {
  const InputPassView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InputPassView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InputPassView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
