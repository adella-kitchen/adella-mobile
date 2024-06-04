import 'package:get/get.dart';

class DetailProdukController extends GetxController {
  //TODO: Implement DetailProdukController

  late final int idMenu;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    idMenu = Get.arguments;
  }
}
