import 'package:adella_kitchen/app/data/models/cart_item.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // List of cart items
  // var cartItems = <CartItem>[].obs;
  RxList<CartItem> cartItems = <CartItem>[].obs;
  RxDouble totalHarga = 0.0.obs;

  @override
  void onInit() {
    super.onInit();

    ever(cartItems, (_) => hitungTotalHarga());

    addItems([
      CartItem(
        id: 1,
        name: 'Barang 1',
        imageUrl: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
        price: 10000,
        quantity: 1,
      ),
      CartItem(
        id: 2,
        name: 'Barang 2',
        imageUrl:
            'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
        price: 15000,
        quantity: 2,
      ),
      CartItem(
        id: 3,
        name: 'Barang 3',
        imageUrl: 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
        price: 20000,
        quantity: 3,
      ),
      CartItem(
        id: 4,
        name: 'Barang 4',
        imageUrl: 'https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg',
        price: 20000,
        quantity: 3,
      ),
      CartItem(
        id: 5,
        name: 'Barang 5',
        imageUrl:
            'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg',
        price: 20000,
        quantity: 3,
      ),
      CartItem(
        id: 6,
        name: 'Barang 6',
        imageUrl:
            'https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg',
        price: 20000,
        quantity: 3,
      ),
      CartItem(
        id: 7,
        name: 'Barang 7',
        imageUrl: 'https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg',
        price: 20000,
        quantity: 3,
      ),
      CartItem(
        id: 8,
        name: 'Barang 8',
        imageUrl: 'https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2.jpg',
        price: 40000,
        quantity: 2,
      ),
    ]);
  }

  // Add an item to the cart
  void addItem(CartItem item) {
    cartItems.add(item);
  }

  void addItems(List<CartItem> items) {
    cartItems.addAll(items);
  }

  // Remove an item from the cart
  void removeItem(int id) {
    cartItems.removeWhere((item) => item.id == id);
  }

  // Method untuk menghitung total harga
  void hitungTotalHarga() {
    double total = 0.0;
    for (var item in cartItems) {
      if (item.isSelected) {
        total += item.price
            // * item.quantity
            ;
      }
    }
    totalHarga.value = total;
  }

  void toggleItemSelection(int itemId) {
    final selectedItemIndex = cartItems.indexWhere((item) => item.id == itemId);
    if (selectedItemIndex != -1) {
      cartItems[selectedItemIndex].isSelected =
          !cartItems[selectedItemIndex].isSelected;
      cartItems.refresh();
    } else {
      print('Item with id $itemId not found in cartItems list.');
    }
  }

  // Update the quantity of an item in the cart
  void updateQuantity(String id, int quantity) {
    var index = cartItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      var item = cartItems[index];
      cartItems[index] = CartItem(
        id: item.id,
        name: item.name,
        imageUrl: item.imageUrl,
        price: item.price,
        quantity: quantity,
      );
    }
  }

  // Get the total price of the cart
  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  // Method to calculate total price of selected items
  double calculateSelectedTotalPrice() {
    double totalPrice = 0;
    for (var item in cartItems) {
      if (item.isSelected) {
        totalPrice += item.price * item.quantity;
      }
    }
    return totalPrice;
  }

  // Method to calculate total number of selected items
  int calculateSelectedTotalItems() {
    int totalItems = 0;
    for (var item in cartItems) {
      if (item.isSelected) {
        totalItems += item.quantity;
      }
    }
    return totalItems;
  }
}
