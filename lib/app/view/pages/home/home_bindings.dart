import 'package:get/get.dart';
import 'package:thismed_app/app/view/pages/home/home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeContentController());
  }
}
