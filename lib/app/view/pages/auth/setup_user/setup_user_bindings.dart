import 'package:get/get.dart';
import './setup_user_controller.dart';

class SetupUserBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SetupUserController());
  }
}
