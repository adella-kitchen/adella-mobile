import 'package:adella_kitchen/components/partials/navbar.dart';
import 'package:adella_kitchen/theme/myColors.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors().primaryColor,
      body: AnimatedSplashScreen(
      splash: Transform.scale(
      scale: 2.5, child: Image.asset('assets/img/testimg.png')),
      duration: 1500,
      splashTransition: SplashTransition.scaleTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
      backgroundColor: MyColors().primaryColor,
      nextScreen: const Navbar(),        
      ),
    );
    }
  }

