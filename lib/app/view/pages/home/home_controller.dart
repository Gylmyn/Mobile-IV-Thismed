import 'package:get/get.dart';
import 'package:thismed_app/app/data/model/models.dart';
import 'package:thismed_app/app/data/services/services.dart';

class HomeContentController extends GetxController {
  RxList<Users> data = <Users>[].obs;
  RxList<Users> sortDataByLikes = <Users>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      var response = await ApiCall.fetchData();
      data.value = response;

      // Sorting data based on likes
      sortDataByLikes.assignAll(response);
      sortDataByLikes.sort((a, b) => b.posts!
          .map((post) => post.likes)
          .reduce((value, element) => value + element)
          .compareTo(a.posts!
              .map((post) => post.likes)
              .reduce((value, element) => value + element)));
    } catch (e) {
      print(e);
    }
  }
}
