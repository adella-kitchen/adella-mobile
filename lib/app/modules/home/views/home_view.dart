import 'package:adella_kitchen/app/data/api/api.dart';
import 'package:adella_kitchen/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:adella_kitchen/app/modules/explore/views/widget.dart';
import 'package:adella_kitchen/app/modules/home/views/widget.dart';
import 'package:adella_kitchen/app/routes/app_pages.dart';
import 'package:adella_kitchen/theme/app_theme.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:adella_kitchen/theme/widget/app_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../controllers/home_controller.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

class HomeView extends GetView<HomeController> {
  final DashboardController dashboardController =
      Get.find<DashboardController>();
  TextEditingController searchController = TextEditingController();
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header section
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: myColor().primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selamat berbelanja 👋',
                            style: TextStyle(
                                fontSize: fontSize().regular,
                                color: Colors.white),
                          ),
                          Obx(() {
                            if (dashboardController.name.value.isEmpty) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            return Text(
                              dashboardController.name.value,
                              style: TextStyle(
                                fontSize: fontSize().medium,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          })
                        ],
                      ),
                      const Spacer(),
                      CartIconWithBadge()
                    ],
                  ),
                  const SizedBox(height: 13),
                  TfSearch(
                    hint: 'Cari Menu Makanan',
                    controller: searchController,
                    borderSide: BorderSide.none,
                    onTap: () => Get.toNamed(Routes.EXPLORE),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),

            //main content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const titleText(
                    text: 'Kategori',
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 10),
                  CategoryRow(categories: [
                    CategoryItemData(
                        text: 'Makanan',
                        icon: BoxIcons.bxs_bowl_rice,
                        onPressed: () {}),
                    CategoryItemData(
                        text: 'Minuman',
                        icon: BoxIcons.bxs_coffee,
                        onPressed: () {}),
                    CategoryItemData(
                        text: 'Catering',
                        icon: BoxIcons.bxs_dish,
                        onPressed: () {}),
                    CategoryItemData(
                        text: 'Kotakan',
                        icon: BoxIcons.bxs_box,
                        onPressed: () {}),
                    CategoryItemData(
                        text: 'Frozen',
                        icon: BoxIcons.bxs_fridge,
                        onPressed: () {}),
                  ]),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    child: Row(
                      children: [
                        titleText(
                          text: 'Promo Untukmu',
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),

                  Obx(() {
                    return CarouselSlider(
                      items: controller.myPromo.map((promo) {
                        return GestureDetector(
                          onTap: () {
                            print('id promo di klik: ${promo.idPromo}');
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: FancyShimmerImage(
                                imageUrl: promo.gambarPromo,
                                boxFit: BoxFit.cover,
                                width: 1000.0,
                                errorWidget: const Center(
                                  child: Text('Error loading image'),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayInterval: const Duration(seconds: 2),
                        aspectRatio: 2.0,
                        height: 150,
                        onPageChanged: (index, reason) {
                          controller.currentIndex.value = index;
                        },
                      ),
                    );
                  }),

                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Obx(() {
                      final int currentIndex = controller.currentIndex.value;
                      return AnimatedSmoothIndicator(
                        activeIndex: currentIndex,
                        count: controller.myPromo.length,
                        effect: ExpandingDotsEffect(
                          activeDotColor: myColor().primaryColor,
                          spacing: 10,
                          dotHeight: 10,
                          dotWidth: 10,
                        ),
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Row(
                      children: [
                        const titleText(
                          text: 'Produk Kami',
                          textAlign: TextAlign.start,
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () => Get.toNamed(Routes.EXPLORE),
                          child: Text(
                            'Selengkapnya',
                            style: TextStyle(
                              fontSize: 12,
                              color: myColor().primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  // ConstrainedBox for product cards
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height,
                    ),
                    child: CardProductView(controller: controller),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardProductView extends StatelessWidget {
  const CardProductView({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.productMenu.isEmpty) {
        return const Center(child: Text('No products available'));
      }

      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: controller.productMenu.length,
        itemBuilder: (BuildContext context, int index) {
          final menu = controller.productMenu[index];
          return CardProduct(
            ontap: () {
              print(menu.idMenu);
            },
            width: double.infinity,
            height: 200,
            elevation: 3,
            heightImage: 100,
            borderRadius: 4,
            imageProvider: FancyShimmerImage(
              imageUrl: UrlApi().getImgMenu(menu.imgUrl),
              boxFit: BoxFit.cover,
              width: double.infinity,
              errorWidget: const Center(
                child: Text('Error loading image'),
              ),
            ),
            title: _title(title: menu.menuName),
            description: _content(
              harga: menu.priceMenu,
              color: myColor().primaryColor,
            ),
          );
        },
      );
    });
  }
}

Widget _title({Color? color, required String title}) {
  return Text(
    title,
    maxLines: 2,
    style: TextStyle(fontSize: 14, color: color, fontWeight: FontWeight.w500),
  );
}

Widget _content({Color? color, required int harga}) {
  final HomeController controller = Get.find<HomeController>();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        controller.formatRupiah(harga),
        style:
            TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 5,
      ),
    ],
  );
}

Widget _footer({required int durasi}) {
  return Row(
    children: [
      Icon(
        IonIcons.time,
        color: myColor().grey500,
        size: 13.5,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Text(
          '$durasi Hari Pre Order',
          style: TextStyle(color: myColor().grey500, fontSize: 12),
        ),
      ),
    ],
  );
}

Widget _tag(String tag, VoidCallback onPressed) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: myColor().primaryColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Text(
        tag,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
