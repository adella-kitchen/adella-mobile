import 'dart:convert';

import 'package:adella_kitchen/app/data/api/api.dart';
import 'package:adella_kitchen/app/data/models/product.dart';
import 'package:adella_kitchen/theme/widget/app_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class ExploreController extends GetxController {
  late TextEditingController searchController = TextEditingController();  
  var productMenu = <AllMenu>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {    
    super.onInit();    
    fetchMenu();
  }

  Future<void> fetchMenu() async {
    try {      
      isLoading(true);

      final token = await Api().getToken();

      final response = await http.get(
        Uri.parse(Api().allMenu),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'] as List;
        productMenu.value = data.map((menu) => AllMenu.fromJson(menu)).toList();
        
      } else {
        CustomSnackBar.showError('Error', 'Failed to load menu');
      }
      
    } catch (e) {
      CustomSnackBar.showError('Error', 'Failed to load menu $e');
      
    } finally {
      isLoading(false);
    }
  }

  String formatRupiah(int number) {
    NumberFormat currencyFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return currencyFormat.format(number);
  }
}
