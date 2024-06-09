import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;

  final storage = const FlutterSecureStorage();
  var token = ''.obs;
  var idUser = ''.obs;
  var email = ''.obs;
  var name = ''.obs;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  Future<void> loadUserData() async {
    token.value = await storage.read(key: 'token') ?? '';
    idUser.value = await storage.read(key: 'id_user') ?? '';
    email.value = await storage.read(key: 'email') ?? '';
    name.value = await storage.read(key: 'name') ?? '';
  }
}
