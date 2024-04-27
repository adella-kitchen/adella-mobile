import 'package:adella_kitchen/app/modules/home/views/data_img.dart';
import 'package:adella_kitchen/app/modules/home/views/widget.dart';
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

class HomeView extends GetView<HomeController> {
  TextEditingController searchController = TextEditingController();
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());

    List<Map<String, dynamic>> myProducts = List.generate(
      10,
      (index) => {"id": index + 1, "name": "Product ${index + 1}"},
    );

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                        Text(
                          'Lutfi Hakim',
                          style: TextStyle(
                            fontSize: fontSize().medium,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Material(
                      color: const Color(0xFFDC495C),
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          // Tambahkan aksi yang ingin dilakukan saat tombol ditekan
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: const Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 13),
                TfSearch(
                    hint: 'Cari Menu Makanan', controller: searchController, borderSide: BorderSide.none,),
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
                const titleText(text: 'Kategori'),
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
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Row(
                    children: [
                      const titleText(text: 'Promo Untukmu'),
                      const Spacer(),
                      Text(
                        'Selengkapnya',
                        style: TextStyle(
                            fontSize: 12,
                            color: myColor().primaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                CarouselSlider(
                    items: ImageDummy.innerStyleImages,
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayInterval: const Duration(seconds: 2),
                      aspectRatio: 2.0,
                      height: 150,
                      onPageChanged: (index, reason) {
                        controller.currentIndex.value = index;
                      },
                    )),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Obx(() {
                    final int currentIndex = controller.currentIndex.value;
                    return AnimatedSmoothIndicator(
                      activeIndex: currentIndex,
                      count: ImageDummy.innerStyleImages.length,
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
                        const titleText(text: 'Produk Kami'),
                        const Spacer(),
                        Text(
                          'Selengkapnya',
                          style: TextStyle(
                              fontSize: 12,
                              color: myColor().primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                    ),
                FillImageCard(
                  width: 180,
                  heightImage: 120,
                  imageProvider: const NetworkImage(
                    'https://codecanyon.img.customer.envatousercontent.com/files/352931146/Preview.jpg?auto=compress%2Cformat&q=80&fit=crop&crop=top&max-h=8000&max-w=590&s=29e647d179d8704189dced38088fac34',
                  ),
                  title: _title(),
                  // tags: [
                  //   _tag('Diskon 15%', () {}),
                  // ],
                  description: _content(),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

Widget _title({Color? color}) {
  return Text(
    'Nasi Kebuli',
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: color),
  );
}

Widget _content({Color? color}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Rp. 15,000',
        style: TextStyle(color: color),
      ),
      const SizedBox(
        height: 5,
      ),
      Row(
        children: [
          Icon(
            IonIcons.time,
            color: myColor().grey500,
            size: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              '2 Hari',
              style: TextStyle(color: myColor().grey500, fontSize: 12),
            ),
          ),
        ],
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
          color: myColor().primaryColor),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Text(
        tag,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
