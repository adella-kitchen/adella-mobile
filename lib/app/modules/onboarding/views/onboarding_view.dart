import 'package:adella_kitchen/app/modules/onboarding/views/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          //horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              onBoardingPage(
                title: 'Pesan Makanan dengan Mudah',
                desc:
                    'Adella Kitchen akan membantumu untuk memesan makanan dengan mudah, kapanpun dan dimanapun!',
                imageUrl: 'assets/img/page1.png',
              ),
              onBoardingPage(
                title: 'Pesananmu Akan Kami Antarkan',
                desc:
                    'Nikmati pelayanan antar makanan dari kami tanpa khawatir akan waktu dan kualitas pengantaran',
                imageUrl: 'assets/img/page2.png',
              ),
              onBoardingPage(
                title: 'Belanja simpel dan aman, dengan kemudahan COD!',
                desc:
                    'Nikmati kemudahan dalam ragam opsi pembayaran serta pelayanan Cash On Delivery yang kami sediakan',
                imageUrl: 'assets/img/page3.png',
              ),
            ],
          ),
          //skip btn
          const skipBtn(),
          pageIndicator(),
          const indicatorText(),
          const NextBtn(),
        ],
      ),
    ));
  }
}
