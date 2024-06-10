import 'package:adella_kitchen/app/modules/dashboard/views/dashboard_view.dart';
import 'package:adella_kitchen/app/modules/login/controllers/login_controller.dart';
import 'package:adella_kitchen/app/modules/login/views/login_view.dart';
import 'package:adella_kitchen/app/routes/app_pages.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Image.asset('assets/img/adela_white.png'),
        duration: 1500,
        backgroundColor: myColor().primaryColor,
        pageTransitionType: PageTransitionType.fade,
        nextScreen: LoginView());
  }
}
