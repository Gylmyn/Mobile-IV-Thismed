import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thismed_app/app/view/layout/constant/themes/themes.dart';
import 'package:thismed_app/app/view/pages/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: FutureBuilder(
          future: controller.splashC(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Image.asset(
                  'assets/images/main-logo.png',
                  width: 400,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
