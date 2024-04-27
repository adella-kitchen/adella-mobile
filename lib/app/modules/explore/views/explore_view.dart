import 'package:adella_kitchen/app/modules/explore/views/widget.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:adella_kitchen/theme/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

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
              padding: const EdgeInsets.all(8),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Change this value based on your needs
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: controller.myProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomCard(
                    title: controller.myProducts[index]["name"],
                    description: "Deskripsi Product ${index + 1}",
                    imageUrl: "https://via.placeholder.com/150",
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
