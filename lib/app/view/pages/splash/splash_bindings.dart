import 'package:get/get.dart';
import 'package:thismed_app/app/view/pages/splash/splash_controller.dart';

class SplashBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
