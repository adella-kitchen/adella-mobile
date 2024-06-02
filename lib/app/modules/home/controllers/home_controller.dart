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
          gambarPromo:
              'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/new-arrival-discount-offer-on-shoes-poster-ad-design-template-20e8be063593e460ec1eadf156df2a71_screen.jpg?ts=1607504280'),
      Promo(
          idPromo: 2,
          judulPromo: 'Promo 2',
          deskripsiPromo: 'Promo 2',
          gambarPromo:
              'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/clothing-store-banner-design-template-e7332aaf6402c88cb4623bf8eb6f97e2_screen.jpg?ts=1620867237'),
      Promo(
          idPromo: 3,
          judulPromo: 'Promo 3',
          deskripsiPromo: 'Promo 3',
          gambarPromo:
              'https://elements-cover-images-0.imgix.net/f67401c2-06cb-4344-979b-f3234d681768?auto=compress%2Cformat&w=900&fit=max&s=75495e228f330d5446b90794cd1319ca'),
      Promo(
          idPromo: 4,
          judulPromo: 'Promo 4',
          deskripsiPromo: 'Promo 4',
          gambarPromo:
              'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/online-fashion-sale-banner-template-design-cc34c2027d0bb5ccc2ff90231abaa242_screen.jpg?ts=1613395464'),
      Promo(
          idPromo: 5,
          judulPromo: 'Promo 5',
          deskripsiPromo: 'Promo 5',
          gambarPromo:
              'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/fashion-store-facebook-ad-banner-design-template-754121190affdca4b258b77da2984528_screen.jpg?ts=1655421066'),
      Promo(
          idPromo: 6,
          judulPromo: 'Promo 6',
          deskripsiPromo: 'Promo 6',
          gambarPromo:
              'https://codecanyon.img.customer.envatousercontent.com/files/352931146/Preview.jpg?auto=compress%2Cformat&q=80&fit=crop&crop=top&max-h=8000&max-w=590&s=29e647d179d8704189dced38088fac34'),
      Promo(
          idPromo: 7,
          judulPromo: 'Promo 7',
          deskripsiPromo: 'Promo 7',
          gambarPromo:
              'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/shoes-craze-sale-facebook-ad-design-template-b1d1738fd5e9e0f6e3152ec502a1c2e1_screen.jpg?ts=1567579016'),
    ];
  }

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
    ];
  }

  String formatRupiah(int harga) {
    NumberFormat currencyFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return currencyFormat.format(harga);
  }
}
