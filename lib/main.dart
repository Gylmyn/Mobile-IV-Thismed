import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thismed_app/app/view/layout/routes/routes_name.dart';
import 'package:thismed_app/app/view/layout/routes/routes_page.dart';

void main() {
  runApp(const Thismed());
}

class Thismed extends StatelessWidget {
  const Thismed({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: RoutePage.ROUTES,
        initialRoute: RouteName.BOTNAVBAR);
  }
}
