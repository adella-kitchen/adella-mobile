import 'package:adella_kitchen/app/data/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ExploreController extends GetxController {
  late TextEditingController searchController = TextEditingController();
  var myMenu = <AllMenu>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadProducts();
  }

//dummy data
  void loadProducts() {
    myMenu.value = [
      AllMenu(
          idMenu: 1,
          menuCategory: 'Makanan',
          menuName: 'Nasi Goreng',
          priceMenu: 20000,
          variantImg:
              'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'),
      AllMenu(
          idMenu: 2,
          menuCategory: 'Makanan',
          menuName: 'Ayam Geprek',
          priceMenu: 15000,
          variantImg:
              'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg'),
      AllMenu(
        idMenu: 3,
        menuCategory: 'Makanan',
        menuName: 'Sate Ayam',
        priceMenu: 25000,
        variantImg: 'https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg',
      ),
      AllMenu(
        idMenu: 4,
        menuCategory: 'Makanan',
        menuName: 'Bakso',
        priceMenu: 18000,
        variantImg:
            'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg',
      ),
      AllMenu(
        idMenu: 5,
        menuCategory: 'Minuman',
        menuName: 'Es Teh Manis',
        priceMenu: 5000,
        variantImg:
            'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
      ),
      AllMenu(
        idMenu: 6,
        menuCategory: 'Minuman',
        menuName: 'Jus Alpukat',
        priceMenu: 10000,
        variantImg:
            'https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg',
      ),
      AllMenu(
        idMenu: 7,
        menuCategory: 'Makanan',
        menuName: 'Mie Ayam',
        priceMenu: 12000,
        variantImg: 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
      ),
      AllMenu(
        idMenu: 8,
        menuCategory: 'Makanan',
        menuName: 'Nasi Uduk',
        priceMenu: 14000,
        variantImg: 'https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg',
      ),
      AllMenu(
        idMenu: 9,
        menuCategory: 'Makanan',
        menuName: 'Rendang',
        priceMenu: 30000,
        variantImg: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
      ),
      AllMenu(
        idMenu: 10,
        menuCategory: 'Makanan',
        menuName: 'Gado-gado',
        priceMenu: 16000,
        variantImg:
            'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
      ),
    ];
  }

  String formatRupiah(int number) {
    NumberFormat currencyFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return currencyFormat.format(number);
  }
}
