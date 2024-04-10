import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thismed_app/app/view/pages/home/home_page.dart';
import 'package:thismed_app/app/view/pages/post/post_page.dart';
import 'package:thismed_app/app/view/pages/profile/profile_page.dart';
import 'package:thismed_app/app/view/pages/search/search_page.dart';

class BotNavController extends GetxController {
  final RxInt index = 0.obs;
  final PageController pageController = PageController();

  final List<Widget> pages = [
    HomePage(),
    SearchPage(),
    PostPage(),
    ProfilePage()
  ];

  final List navs = [
    {
      'icon_on': Icons.home,
      'icon_off': Icons.home_outlined,
      'label': 'Home',
    },
    {
      'icon_on': Icons.search,
      'icon_off': Icons.search_outlined,
      'label': 'Search',
    },
    {
      'icon_on': Icons.add_box,
      'icon_off': Icons.add_box_outlined,
      'label': 'New Post',
    },
    {
      'icon_on': Icons.account_circle,
      'icon_off': Icons.account_circle_outlined,
      'label': 'Profile',
    },
  ];
}
