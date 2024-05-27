class CartItem {
  final int id;
  final String name;
  final String imageUrl;
   double price;
  final int quantity;
  bool isSelected;

  CartItem(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.price,
      required this.quantity,
      this.isSelected = false});
}
