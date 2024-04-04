import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thismed_app/view/pages/home/home_page.dart';
import 'package:thismed_app/view/pages/post/add_post_page.dart';
import 'package:thismed_app/view/pages/profile/user_profile_page.dart';
import 'package:thismed_app/view/pages/search/search_page.dart';

class BotNavController extends GetxController {
  final RxInt index = 0.obs;
  final PageController pageController = PageController();

  final List<Widget> pages = [
    HomePage(),
    SearchPage(),
    AddPostPage(),
    UserProfilePage()
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
