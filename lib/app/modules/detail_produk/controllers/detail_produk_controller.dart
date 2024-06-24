import 'dart:convert';

import 'package:adella_kitchen/app/data/api/api.dart';
import 'package:adella_kitchen/app/data/models/detail_product.dart';
import 'package:adella_kitchen/theme/widget/app_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class DetailProdukController extends GetxController {
  late final int idMenu;
  var productMenu = DetailMenu(
    idMenu: 0,
    menuCategory: '',
    menuName: '',
    descMenu: '',
    priceMenu: 0,
    menuImg: '',
    variants: [],
  ).obs;
  var isLoading = false.obs;

  RxInt quantity = 3.obs;
  RxInt totalPrice = 0.obs;

  @override
  void onInit() {
    super.onInit();
    idMenu = Get.arguments;
    print("ID Menu: $idMenu");
    fetchDetailMenu(idMenu);
  }

  Future<void> fetchDetailMenu(int id) async {
    try {
      isLoading(true);

      final token = await Api().getToken();
      print("Token: $token"); // Log token

      final response = await http.get(
        Uri.parse(Api().detailMenu(id)),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        DetailMenu detailMenu = DetailMenu.fromJson(data['data']);
        productMenu.value = detailMenu;
        print("Product Menu: ${productMenu.value}"); // Log productMenu

        updateTotalPrice();
      } else {
        CustomSnackBar.showError('Error', 'Failed to load menu');
      }
    } catch (e) {
      CustomSnackBar.showError('Error', 'Failed to load menu $e');
    } finally {
      isLoading(false);
    }
  }

  // New methods for cart functionality
  void addToCart() {
    quantity.value++;
    updateTotalPrice();
  }

  void removeFromCart() {
    if (quantity.value > 0) {
      quantity.value--;
      updateTotalPrice();
    }
  }

  void updateTotalPrice() {
    totalPrice.value = productMenu.value.priceMenu * quantity.value;
  }

  String formatRupiah(int harga) {
    NumberFormat currencyFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return currencyFormat.format(harga);
  }
}
