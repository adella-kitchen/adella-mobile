class Api {

  var ip = '192.168.1.11';
  String get url => 'http://$ip:8000/api';

  //get method
  String get login => '$url/login';
  String get logout => '$url/logout';
  String get allMenu => '$url/menu';
  String limitMenu(int limit) => '$url/menu?limit=$limit';
  String menuCategory(String kategori) => '$url/menu/kategori/$kategori';
  String detailMenu(int id) => '$url/menu/$id';
  String get promo => '$url/promo';
}