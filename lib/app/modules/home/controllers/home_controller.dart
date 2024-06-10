import 'dart:convert';

import 'package:adella_kitchen/app/data/api/api.dart';
import 'package:adella_kitchen/app/data/models/product.dart';
import 'package:adella_kitchen/app/data/models/promo.dart';
import 'package:adella_kitchen/theme/widget/app_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;  
  var myPromo = <Promo>[].obs;
  var productMenu = <AllMenu>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadPromo(); // ini masih belom pake api
    fetchMenu(); // ini sudah pake api
  }

  Future<void> fetchMenu() async {
    try {      
      isLoading(true);

      final token = await Api().getToken();

      final response = await http.get(
        Uri.parse(Api().limitMenu(4)),
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

  void loadPromo() {
    myPromo.value = [
      Promo(
          idPromo: 1,
          judulPromo: 'Promo 1',
          deskripsiPromo: 'Promo 1',
          gambarPromo: UrlApi().getImgPromo('promo1.jpg')),
      Promo(
          idPromo: 2,
          judulPromo: 'Promo 2',
          deskripsiPromo: 'Promo 2',
          gambarPromo: UrlApi().getImgPromo('promo2.jpg')),
      Promo(
          idPromo: 3,
          judulPromo: 'Promo 3',
          deskripsiPromo: 'Promo 3',
          gambarPromo: UrlApi().getImgPromo('promo3.jpg')),
      Promo(
          idPromo: 4,
          judulPromo: 'Promo 4',
          deskripsiPromo: 'Promo 4',
          gambarPromo: UrlApi().getImgPromo('promo4.jpg')),
      Promo(
          idPromo: 5,
          judulPromo: 'Promo 5',
          deskripsiPromo: 'Promo 5',
          gambarPromo: UrlApi().getImgPromo('promo5.jpg')),
    ];
  }

  String formatRupiah(int harga) {
    NumberFormat currencyFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return currencyFormat.format(harga);
  }
}
