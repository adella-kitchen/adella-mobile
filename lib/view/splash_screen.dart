import 'package:adella_kitchen/theme/myColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  // late Animation<double> _scaleAnimation;
  // late Animation<double> _fadeOutAnimation;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500), // Total durasi 2.5 detik
    );

    // _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
    //   CurvedAnimation(
    //     parent: _animationController,
    //     curve: const Interval(0.0, 0.5,
    //         curve: Curves.easeInOut), // Scale animation setengah lebih cepat
    //   ),
    // );

    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // _fadeOutAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
    //   CurvedAnimation(
    //     parent: _animationController,
    //     curve: const Interval(0.5, 1.0,
    //         curve: Curves.easeInOut), // Fade out pada sisanya
    //   ),
    // );

    _animationController.forward();

    Future.delayed(const Duration(milliseconds: 2500), () {
      Navigator.of(context).pushReplacementNamed('/nav');
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors().primaryColor,
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: _fadeInAnimation.value,
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.food_bank_rounded,
                      size: 80,
                      color: MyColors().primaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Opacity(
                  opacity: _fadeInAnimation.value,
                  child: const Text(
                    'Addella Kitchen',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
