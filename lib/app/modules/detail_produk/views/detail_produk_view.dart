import 'package:adella_kitchen/app/data/api/api.dart';
import 'package:adella_kitchen/app/data/models/detail_product.dart';
import 'package:adella_kitchen/app/modules/detail_produk/views/bottom_sheet.dart';
import 'package:adella_kitchen/app/modules/detail_produk/views/dropdrown.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_produk_controller.dart';

class DetailProdukView extends GetView<DetailProdukController> {
  const DetailProdukView({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomSheetHeight = MediaQuery.of(context).size.height * 0.2;

    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(
                child: CircularProgressIndicator(
              color: myColor().primaryColor,
            ));
          }

          final menu = controller.productMenu.value;

          return Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.only(bottom: bottomSheetHeight - 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Center(
                          child: Image.network(
                            UrlApi().getImgMenu(menu.menuImg),
                            width: double.infinity,
                            height: 300,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 12,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back,
                                  color: Colors.white),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            menu.menuName,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            menu.descMenu,
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            controller.formatRupiah(menu.priceMenu),
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: myColor().primaryColor,
                                ),
                          ),
                          const SizedBox(height: 20),
                          // Generate dropdowns dynamically based on variants
                          ...menu.variants.map((variant) {
                            List<String> detailItems = variant.detailVariants
                                .map((detail) => detail.variantDetail)
                                .toList();
                            detailItems.insert(0, 'Pilih Item');
                            var selectedItem = 'Pilih Item'.obs;

                            return MyDropDown(
                              items: detailItems,
                              selectedItem: selectedItem,
                              title: '* ${variant.variantName}',
                            );
                          }),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: BottomViewDetailProduk(),
              ),
            ],
          );
        }),
      ),
    );
  }
}
