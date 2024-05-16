import 'package:flutter/cupertino.dart';
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
      'icon_on': CupertinoIcons.house_fill,
      'icon_off': CupertinoIcons.house,
      'label': 'Home',
    },
    {
      'icon_on': CupertinoIcons.add_circled_solid,
      'icon_off': CupertinoIcons.add_circled,
      'label': 'New Post',
    },
    {
      'icon_on': CupertinoIcons.search_circle_fill,
      'icon_off': CupertinoIcons.search_circle,
      'label': 'Search',
    },
  ];
}
