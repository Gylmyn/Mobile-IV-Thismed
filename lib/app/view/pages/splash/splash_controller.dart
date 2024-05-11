import 'package:get/get.dart';
import 'package:thismed_app/app/view/layout/routes/routes_name.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    splashC();
    super.onInit();
  }

  Future<void> splashC() async {
    await Future.delayed(const Duration(seconds: 4));
    Get.offNamed(RouteName.SIGNIN);
  }
}
