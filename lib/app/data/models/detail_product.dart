import 'dart:convert';

class DetailMenu {
  int idMenu;
  String menuCategory;
  String menuName;
  String descMenu;
  int priceMenu;
  String menuImg;
  List<Variant> variants;

  DetailMenu({
    required this.idMenu,
    required this.menuCategory,
    required this.menuName,
    required this.descMenu,
    required this.priceMenu,
    required this.menuImg,
    required this.variants,
  });

  factory DetailMenu.fromJson(Map<String, dynamic> json) {
    var variantsList = json['variants'] as List;
    List<Variant> variants = variantsList.map((variant) => Variant.fromJson(variant)).toList();

    return DetailMenu(
      idMenu: json['id_menu'],
      menuCategory: json['menu_category'],
      menuName: json['menu_name'],
      descMenu: json['desc_menu'],
      priceMenu: json['price_menu'],
      menuImg: json['menu_img'],
      variants: variants,
    );
  }
}

class Variant {
  int idVariant;
  String variantName;
  int idMenu;
  String descVariant;
  List<DetailVariant> detailVariants;

  Variant({
    required this.idVariant,
    required this.variantName,
    required this.idMenu,
    required this.descVariant,
    required this.detailVariants,
  });

  factory Variant.fromJson(Map<String, dynamic> json) {
    var detailVariantsList = json['detail_variants'] as List;
    List<DetailVariant> detailVariants = detailVariantsList.map((detailVariant) => DetailVariant.fromJson(detailVariant)).toList();

    return Variant(
      idVariant: json['id_variant'],
      variantName: json['variant_name'],
      idMenu: json['id_menu'],
      descVariant: json['desc_variant'],
      detailVariants: detailVariants,
    );
  }
}

class DetailVariant {
  int idDetailVariant;
  int idVariant;
  String variantDetail;
  int additionalPrice;

  DetailVariant({
    required this.idDetailVariant,
    required this.idVariant,
    required this.variantDetail,
    required this.additionalPrice,
  });

  factory DetailVariant.fromJson(Map<String, dynamic> json) {
    return DetailVariant(
      idDetailVariant: json['id_detail_variant'],
      idVariant: json['id_variant'],
      variantDetail: json['variant_detail'],
      additionalPrice: json['additional_price'],
    );
  }
}
