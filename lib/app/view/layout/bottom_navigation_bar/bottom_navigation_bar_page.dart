import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thismed_app/app/view/layout/bottom_navigation_bar/bottom_navigation_bar_controller.dart';
import 'package:thismed_app/app/view/layout/constant/themes/themes.dart';

class BottomNavBar extends GetView<BotNavController> {
  const BottomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        children: controller.pages,
        onPageChanged: (index) {
          controller.index.value = index;
        },
      ),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
              color: bgColor, borderRadius: BorderRadius.circular(30)),
          height: 80,
          child: BottomNavigationBar(
            iconSize: 34,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: primaryColor,
            unselectedItemColor: primaryTextColor,
            backgroundColor: bgColor,
            items: List.generate(controller.navs.length, (index) {
              var nav = controller.navs[index];
              return BottomNavigationBarItem(
                icon: Icon(nav['icon_off']),
                label: '',
                activeIcon: Icon(nav['icon_on']),
              );
            }),
            currentIndex: controller.index.value,
            onTap: (index) {
              controller.pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
      ),
    );
  }
}
