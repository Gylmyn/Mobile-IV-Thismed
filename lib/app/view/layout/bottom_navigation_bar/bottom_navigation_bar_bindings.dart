import 'package:get/get.dart';
import 'bottom_navigation_bar_controller.dart';

class BottomNavigationBarBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BotNavController());
  }
}
