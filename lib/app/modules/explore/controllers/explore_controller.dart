import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreController extends GetxController {
  late TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> myProducts = List.generate(
    11,
    (index) => {"id": index + 1, "name": "Product ${index + 1}"},
  );
}
