import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:thismed_app/app/view/layout/routes/routes_name.dart';
import 'package:thismed_app/app/view/layout/routes/routes_page.dart';
import 'package:thismed_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");
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
        initialRoute: RouteName.SIGNIN);
  }
}
