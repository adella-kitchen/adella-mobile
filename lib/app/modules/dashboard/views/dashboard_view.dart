import 'package:adella_kitchen/app/modules/cart/views/cart_view.dart';
import 'package:adella_kitchen/app/modules/explore/views/explore_view.dart';
import 'package:adella_kitchen/app/modules/home/views/home_view.dart';
import 'package:adella_kitchen/app/modules/profile/views/profile_view.dart';
import 'package:adella_kitchen/theme/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
            child: IndexedStack(
          index: controller.tabIndex,
          children: [
            HomeView(),
            ExploreView(),
            const CartView(),
            const ProfileView()
          ],
        )),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: myColor().primaryColor,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomNavigationBarItem(
                activeIcon: Ionicons.home,
                icon: Ionicons.home_outline,
                label: 'Home'),
            _bottomNavigationBarItem(
                activeIcon: Ionicons.search,
                icon: Ionicons.search_outline,
                label: 'Search'),
            _bottomNavigationBarItem(
                activeIcon: Ionicons.cart,
                icon: Ionicons.cart_outline,
                label: 'Cart'),
            _bottomNavigationBarItem(
                activeIcon: Ionicons.person,
                icon: Ionicons.person_outline,
                label: 'Profile'),
          ],
        ),
      );
    });
  }
}

_bottomNavigationBarItem(
    {required IconData activeIcon,
    required IconData icon,
    required String label}) {
  return BottomNavigationBarItem(
      activeIcon: Icon(activeIcon), icon: Icon(icon), label: label);
}
