import 'package:adella_kitchen/app/data/models/cart_item.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // List of cart items
  // var cartItems = <CartItem>[].obs;
  RxList<CartItem> cartItems = <CartItem>[].obs;
  RxDouble totalHarga = 0.0.obs;
  RxDouble totalHargaSelected = 0.0.obs;

  @override
  void onInit() {
    super.onInit();

    ever(cartItems, (_) => hitungTotalHarga());

    addItems([
      CartItem(
        id: 1,
        name: 'Paket Ayam Bebek',
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
        quantity: 1,
      ),
      CartItem(
        id: 3,
        name: 'Barang 3',
        imageUrl: 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
        price: 25000,
        quantity: 1,
      ),
      CartItem(
        id: 4,
        name: 'Barang 4',
        imageUrl: 'https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg',
        price: 19000,
        quantity: 1,
      ),
      CartItem(
        id: 5,
        name: 'Barang 5',
        imageUrl:
            'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg',
        price: 15000,
        quantity: 1,
      ),
      CartItem(
        id: 6,
        name: 'Barang 6',
        imageUrl:
            'https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg',
        price: 17000,
        quantity: 1,
      ),
      CartItem(
        id: 7,
        name: 'Barang 7',
        imageUrl: 'https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg',
        price: 12000,
        quantity: 1,
      ),
      CartItem(
        id: 8,
        name: 'Barang 8',
        imageUrl: 'https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2.jpg',
        price: 55000,
        quantity: 1,
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

  // Method to remove selected items
  void removeSelectedItems() {
    cartItems.removeWhere((item) => item.isSelected);
  }

  // Method to check if any item is selected
  bool get isAnyItemSelected => cartItems.any((item) => item.isSelected);

  // Method untuk menghitung total harga
  void hitungTotalHarga() {
    double total = 0.0;
    double totalSelected = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
      if (item.isSelected) {
        totalSelected += item.price * item.quantity;
      }
    }
    totalHarga.value = total;
    totalHargaSelected.value = totalSelected;
  }

  void updateItemPrice(int id, double newPrice) {
    var index = cartItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      var oldItem = cartItems[index];
      cartItems[index] = CartItem(
        id: oldItem.id,
        name: oldItem.name,
        imageUrl: oldItem.imageUrl,
        price: newPrice, // Update price of the item
        quantity: oldItem.quantity,
        isSelected: oldItem.isSelected,
      );
      hitungTotalHarga(); // Recalculate total harga
    }
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

// Method to update the quantity of an item in the cart
  void updateQuantity(int id, int quantity) {
    print('Updating quantity for item $id to $quantity'); // Debugging
    print('Type of quantity: ${quantity.runtimeType}'); // Debugging
    var index = cartItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      var oldItem = cartItems[index];
      cartItems[index] = CartItem(
        id: oldItem.id,
        name: oldItem.name,
        imageUrl: oldItem.imageUrl,
        price: oldItem.price,
        quantity: quantity,
        isSelected: oldItem.isSelected,
      );
      hitungTotalHarga();
    }
  }

  // Method to update the total price
  void updateTotalPrice() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    totalHarga.value = total;
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
