// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:thismed_app/bindings/binding.dart';
import 'package:thismed_app/routes/routes_name.dart';
import 'package:thismed_app/view/layout/bottom_navbar.dart';
import 'package:thismed_app/view/pages/auth/sign_in_page.dart';
import 'package:thismed_app/view/pages/auth/sign_up_page.dart';
import 'package:thismed_app/view/pages/home/home_page.dart';
import 'package:thismed_app/view/pages/post/add_post_page.dart';
import 'package:thismed_app/view/pages/profile/user_profile_page.dart';
import 'package:thismed_app/view/pages/search/search_page.dart';
import 'package:thismed_app/view/pages/splash/splash_page.dart';

class RoutePage {
  static final ROUTES = [
    GetPage(
      name: RouteName.SPLASH,
      page: () => const SplashPage(),
    ),
    GetPage(
        name: RouteName.SIGNIN,
        page: () => const SignInPage(),
        binding: BindSignIn()),
    GetPage(
      name: RouteName.BOTNAVBAR,
      page: () => const BottomNavBar(),
      binding: BindBotNav(),
    ),
    GetPage(
        name: RouteName.SIGNUP,
        page: () => const SignUpPage(),
        binding: BindSignUp()),
    GetPage(
        name: RouteName.HOME,
        page: () => const HomePage(),
        binding: BindContent()),
    GetPage(
      name: RouteName.SEARCH,
      page: () => const SearchPage(),
    ),
    GetPage(
      name: RouteName.ADDPOST,
      page: () => const AddPostPage(),
    ),
    GetPage(
      name: RouteName.USERPROFILE,
      page: () => const UserProfilePage(),
    ),
  ];
}
