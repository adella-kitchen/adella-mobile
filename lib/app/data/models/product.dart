class AllMenu {
  int idMenu;
  String menuCategory;
  String menuName;
  String? descMenu;
  int priceMenu;
  String imgUrl;

  AllMenu({
    required this.idMenu,
    required this.menuCategory,
    required this.menuName,
    this.descMenu,
    required this.priceMenu,
    required this.imgUrl,
  });

  factory AllMenu.fromJson(Map<String, dynamic>? json) {
    return AllMenu(
      idMenu: json?['id_menu'] ?? 0, // Default value jika json null
      menuCategory: json?['menu_category'] ?? '',
      menuName: json?['menu_name'] ?? '',
      descMenu: json?['desc_menu'],
      priceMenu: json?['price_menu'] ?? 0,
      imgUrl: json?['menu_img'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_menu': idMenu,
      'menu_category': menuCategory,
      'menu_name': menuName,
      'desc_menu': descMenu,
      'price_menu': priceMenu,
      'menu_img': imgUrl,
    };
  }
}
