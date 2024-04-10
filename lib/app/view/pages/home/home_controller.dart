import 'package:get/get.dart';
import 'package:thismed_app/app/data/model/user_model.dart';

class HomeContentController extends GetxController {
  RxList<User> listContent = <User>[].obs;

  @override
  void onInit() {
    listContent.addAll([
      {
        "id": 1,
        "username": "cihuyyy24434",
        "createdAt": DateTime.now().subtract(const Duration(hours: 1)),
        "image": "assets/images/tree.png",
        "avatar": "assets/images/logo.png",
        "like": 24,
        "dislike": 3,
        "comment": 8,
        "contentTittle": "Pohon Beringin"
      },
      {
        "id": 2,
        "username": "alaeee123",
        "createdAt": DateTime.now().subtract(const Duration(days: 1)),
        "image": "assets/images/tree.png",
        "avatar": "assets/images/logo.png",
        "like": 98,
        "dislike": 20,
        "comment": 60,
        "contentTittle": "Pohon Beringin"
      },
      {
        "id": 3,
        "username": "behhh123",
        "createdAt": DateTime.now().subtract(const Duration(days: 2)),
        "image": "assets/images/tree.png",
        "avatar": "assets/images/logo.png",
        "like": 198,
        "dislike": 40,
        "comment": 80,
        "contentTittle": "Pohon Beringin"
      },
    ].map((json) => User.fromJson(json)).toList());

    super.onInit();
  }
}
