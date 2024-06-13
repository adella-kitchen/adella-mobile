import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Api {
  var ip = '192.168.1.11';
  String get url => 'http://$ip:8000/api';

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  //get method
  String get login => '$url/login';
  String get logout => '$url/logout';
  String get allMenu => '$url/menu';
  String limitMenu(int limit) => '$url/menu?limit=$limit';
  String menuCategory(String kategori) => '$url/menu/kategori/$kategori';
  String detailMenu(int id) => '$url/menu/$id';
  String get promo => '$url/promo';

  Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }
}

class UrlApi extends Api {
  String getImgMenu(String imgUrl) {
    return "http://$ip:8000/img/manajemen_menu/$imgUrl";
  }

  String getImgPromo(String imgUrl) {
    return "http://$ip:8000/img/promo/$imgUrl";
  }
}
