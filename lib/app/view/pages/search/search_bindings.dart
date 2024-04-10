import 'package:get/get.dart';
import 'search_controller.dart';

class SearchBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SrcController());
  }
}
