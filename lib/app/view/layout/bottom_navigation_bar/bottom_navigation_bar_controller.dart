import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:go_router/go_router.dart';
import 'package:thismed_app/app/view/pages/home/home_page.dart';
import 'package:thismed_app/app/view/pages/post/post_page.dart';
import 'package:thismed_app/app/view/pages/search/search_page.dart';

class BotNavController extends GetxController {
  final RxInt index = 0.obs;
  final PageController pageController = PageController();

  // final GoRouter pages = GoRouter(
  //   routes: [
  //     GoRoute(
  //       path: '/',

  //     ),
  //     GoRoute(
  //       path: '/post',

  //     ),
  //     GoRoute(
  //       path: '/search',
  //     ),
  //   ],
  // );

  final List<Widget> pages = [
    const HomePage(),
    const PostPage(),
    const SearchPage(),
  ];

  final List navs = [
    {
      'icon_on': Icons.home,
      'icon_off': Icons.home_outlined,
      'label': 'Home',
    },
    {
      'icon_on': Icons.add_box,
      'icon_off': Icons.add_box_outlined,
      'label': 'New Post',
    },
    {
      'icon_on': Icons.search,
      'icon_off': Icons.search_outlined,
      'label': 'Search',
    },
  ];
}
