import 'package:adella_kitchen/app/data/api/api.dart';
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
          imgUrl: UrlApi().getImgMenu('menu8.jpg')),
      AllMenu(
          idMenu: 2,
          menuCategory: 'Makanan',
          menuName: 'Ayam Geprek',
          priceMenu: 15000,
          imgUrl: UrlApi().getImgMenu('menu2.jpg')),
      AllMenu(
        idMenu: 3,
        menuCategory: 'Makanan',
        menuName: 'Sate Ayam',
        priceMenu: 25000,
        imgUrl: UrlApi().getImgMenu('menu3.jpg'),
      ),
      AllMenu(
        idMenu: 4,
        menuCategory: 'Makanan',
        menuName: 'Bakso',
        priceMenu: 18000,
        imgUrl: UrlApi().getImgMenu('menu4.jpg'),
      ),
      AllMenu(
        idMenu: 5,
        menuCategory: 'Minuman',
        menuName: 'Es Teh Manis',
        priceMenu: 5000,
        imgUrl: UrlApi().getImgMenu('menu5.jpg'),
      ),
      AllMenu(
        idMenu: 6,
        menuCategory: 'Minuman',
        menuName: 'Jus Alpukat',
        priceMenu: 10000,
        imgUrl: UrlApi().getImgMenu('menu6.jpg'),
      ),
    ];
  }

  String formatRupiah(int number) {
    NumberFormat currencyFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return currencyFormat.format(number);
  }
}
