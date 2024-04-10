// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:thismed_app/app/view/layout/bottom_navigation_bar/bottom_navigation_bar_bindings.dart';
import 'package:thismed_app/app/view/layout/bottom_navigation_bar/bottom_navigation_bar_page.dart';
import 'package:thismed_app/app/view/pages/auth/sign_in/sign_in_bindings.dart';
import 'package:thismed_app/app/view/pages/auth/sign_in/sign_in_page.dart';
import 'package:thismed_app/app/view/pages/auth/sign_up/sign_up_bindings.dart';
import 'package:thismed_app/app/view/pages/auth/sign_up/sign_up_page.dart';
import 'package:thismed_app/app/view/pages/home/home_bindings.dart';
import 'package:thismed_app/app/view/pages/home/home_page.dart';
import 'package:thismed_app/app/view/pages/post/post_page.dart';
import 'package:thismed_app/app/view/pages/profile/profile_page.dart';
import 'package:thismed_app/app/view/layout/routes/routes_name.dart';
import 'package:thismed_app/app/view/pages/search/search_page.dart';
import 'package:thismed_app/app/view/pages/splash/splash_page.dart';

class RoutePage {
  static final ROUTES = [
    GetPage(
      name: RouteName.SPLASH,
      page: () => const SplashPage(),
    ),
    GetPage(
        name: RouteName.SIGNIN,
        page: () => const SignInPage(),
        binding: SignInBindings()),
    GetPage(
      name: RouteName.BOTNAVBAR,
      page: () => const BottomNavBar(),
      binding: BottomNavigationBarBindings(),
    ),
    GetPage(
        name: RouteName.SIGNUP,
        page: () => const SignUpPage(),
        binding: SignUpBindings()),
    GetPage(
        name: RouteName.HOME,
        page: () => const HomePage(),
        binding: HomeBindings()),
    GetPage(
      name: RouteName.SEARCH,
      page: () => const SearchPage(),
    ),
    GetPage(
      name: RouteName.ADDPOST,
      page: () => const PostPage(),
    ),
    GetPage(
      name: RouteName.USERPROFILE,
      page: () => const ProfilePage(),
    ),
  ];
}
