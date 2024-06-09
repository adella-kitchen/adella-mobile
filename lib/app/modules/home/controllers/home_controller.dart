import 'package:adella_kitchen/app/data/api/api.dart';
import 'package:adella_kitchen/app/data/models/product.dart';
import 'package:adella_kitchen/app/data/models/promo.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;
  var myMenu = <AllMenu>[].obs;
  var myPromo = <Promo>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
    loadPromo();
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

  String formatRupiah(int harga) {
    NumberFormat currencyFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return currencyFormat.format(harga);
  }
}
