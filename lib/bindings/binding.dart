import 'package:get/get.dart';
import 'package:thismed_app/controllers/botnav_ctrl.dart';
import 'package:thismed_app/controllers/content_ctrl.dart';

class BindSignIn implements Bindings {
  @override
  void dependencies() {}
}

class BindSignUp implements Bindings {
  @override
  void dependencies() {}
}

class BindContent implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContentController());
  }
}

class BindBotNav implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BotNavController());
  }
}
