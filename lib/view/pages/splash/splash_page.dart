import 'package:flutter/material.dart';
import 'package:thismed_app/view/themes/themes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 145,
          height: 145,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
