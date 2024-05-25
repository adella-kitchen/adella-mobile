import 'package:adella_kitchen/app/modules/explore/views/widget.dart';
import 'package:adella_kitchen/app/modules/home/views/widget.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:adella_kitchen/theme/widget/app_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  TextEditingController searchController = TextEditingController();

  ExploreView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ExploreController());
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            title: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TfSearch(
                  hint: 'Cari Makanan',
                  controller: searchController,
                  borderSide: const BorderSide(color: Colors.grey)),
            ),
            bottom: TabBar(
              unselectedLabelColor: const Color.fromARGB(255, 0, 0, 0),
              indicatorColor: myColor().primaryColor,
              isScrollable: true,
              labelStyle: TextStyle(color: myColor().primaryColor),
              tabs: const [
                Tab(
                  text: 'Semua',
                ),
                Tab(
                  text: 'Makanan',
                ),
                Tab(
                  text: 'Kotakan',
                ),
                Tab(
                  text: 'Prasmanan',
                ),
                Tab(
                  text: 'Jajanan',
                ),
              ],
              indicatorSize: TabBarIndicatorSize.label,
            ),
          ),
          body: TabBarView(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: controller.myProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox.expand(
                    child: CardProduct(
                      width: double.infinity,
                      height: 200,
                      elevation: 3,
                      heightImage: 100,
                      borderRadius: 4,
                      imageProvider: NetworkImage(
                          controller.myProducts[index]["imageUrl"]),
                      title:
                          _title(title: controller.myProducts[index]["name"]),
                      description: _content(
                        harga: 15000,
                        color: myColor().primaryColor,
                      ),
                    ),
                  );
                },
              ),
            ),
            const Center(
              child: Text('Makanan'),
            ),
            const Center(
              child: Text('Kotakan'),
            ),
            const Center(
              child: Text('Prasmanan'),
            ),
            const Center(
              child: Text('Jajanan'),
            ),
          ]),
        ));
  }
}

Widget _title({Color? color, required String title}) {
  return Text(
    title,
    maxLines: 2,
    style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.w500),
  );
}

Widget _content({Color? color, required int harga}) {
  final ExploreController controller = Get.find<ExploreController>();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        controller.formatRupiah(harga),
        style:
            TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.bold),
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
