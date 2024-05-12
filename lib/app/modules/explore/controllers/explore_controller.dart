import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ExploreController extends GetxController {
  late TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> myProducts = List.generate(
    11,
    (index) => {
      "id": index + 1,
      "name": "Paket Nasi Ayam Geprek Bawang",
      "imageUrl":
          "https://codecanyon.img.customer.envatousercontent.com/files/352931146/Preview.jpg?auto=compress%2Cformat&q=80&fit=crop&crop=top&max-h=8000&max-w=590&s=29e647d179d8704189dced38088fac34",
    },
  );

  String formatRupiah(int number) {
    NumberFormat currencyFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return currencyFormat.format(number);
  }
}
