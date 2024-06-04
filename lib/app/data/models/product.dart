class AllMenu {
  int idMenu;
  String menuCategory;
  String menuName;
  String? descMenu;
  int priceMenu;
  String variantImg;

  AllMenu({
    required this.idMenu,
    required this.menuCategory,
    required this.menuName,
    this.descMenu,
    required this.priceMenu,
    required this.variantImg,
  });
}

class DetailMenu {
  final int idMenu;
  final String menuCategory;
  final String menuName;
  final String descMenu;
  final int priceMenu;
  final List<Variant> variants;

  DetailMenu({
    required this.idMenu,
    required this.menuCategory,
    required this.menuName,
    required this.descMenu,
    required this.priceMenu,
    required this.variants,
  });
}

class Variant {
  final int idVariant;
  final String variantName;
  final int idMenu;
  final String variantImg;
  final String descVariant;
  final List<DetailVariant> detailVariants;

  Variant({
    required this.idVariant,
    required this.variantName,
    required this.idMenu,
    required this.variantImg,
    required this.descVariant,
    required this.detailVariants,
  });
}

class DetailVariant {
  final int idDetailVariant;
  final int idVariant;
  final String variantDetail;
  final int additionalPrice;

  DetailVariant({
    required this.idDetailVariant,
    required this.idVariant,
    required this.variantDetail,
    required this.additionalPrice,
  });
}
