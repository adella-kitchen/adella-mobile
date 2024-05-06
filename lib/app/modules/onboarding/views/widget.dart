import 'package:adella_kitchen/app/modules/home/views/widget.dart';
import 'package:adella_kitchen/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class skipBtn extends StatelessWidget {
  const skipBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        right: 20,
        child: TextButton(
            onPressed: () => OnboardingController.instance.skipPage(),
            child: Text(
              'Lewati',
              style: TextStyle(color: myColor().primaryColor),
            )));
  }
}

class onBoardingPage extends StatelessWidget {
  const onBoardingPage({
    super.key,
    required this.title,
    required this.desc,
    required this.imageUrl,
  });

  final String title, desc, imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(width: 250, height: 250, image: AssetImage(imageUrl)),
          const SizedBox(
            height: 20,
          ),
          titleText(
            text: title,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(color: myColor().grey500),
          )
        ],
      ),
    );
  }
}

class pageIndicator extends StatelessWidget {
  pageIndicator({
    super.key,
  });

  final controller = OnboardingController.instance;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 100,
        left: 38,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: ExpandingDotsEffect(
            activeDotColor: myColor().primaryColor,
            spacing: 12,
            dotHeight: 14,
            dotWidth: 14,
          ),
        ));
  }
}

class NextBtn extends StatelessWidget {
  const NextBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingController.instance;

    return Obx(() {
      final isVisible = controller.currentPageIndex.value == 2;

      return Positioned(
        bottom: 72,
        right: 33,
        child: AnimatedOpacity(
          opacity: isVisible
              ? 1.0
              : 0.0, // Opacity 1.0 jika isVisible true, sebaliknya 0.0
          duration: const Duration(milliseconds: 400),
          child: Visibility(
            visible: isVisible,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                backgroundColor: myColor().primaryColor,
              ),
              onPressed: () {
                controller.nextPage();
              },
              child: (const Text(
                'Selanjutnya',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ),
      );
    });
  }
}

class indicatorText extends StatelessWidget {
  const indicatorText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 70,
        left: 38,
        child: Text(
          'Geser untuk next >>',
          style: TextStyle(fontSize: 12, color: myColor().grey500),
        ));
  }
}
