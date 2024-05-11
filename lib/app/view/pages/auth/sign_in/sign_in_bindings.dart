import 'package:get/get.dart';
import 'sign_in_controller.dart';

class SignInBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
  }
}
