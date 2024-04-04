import 'package:get/get.dart';
import 'package:thismed_app/model/User_Model.dart';

class ContentController extends GetxController {
  RxList<User> listContent = <User>[].obs;

  @override
  void onInit() {
    listContent.value = [
      {
        "id": "1",
        "username": "cihuyyy24434",
        "createdAt": "1 Jam",
        "image": "assets/images/tree.png",
        "avatar": "assets/images/logo.png",
        "like": "24",
        "dislike": "3",
        "comment": "8",
        "contentTittle": "Pohon Beringin"
      },
      {
        "id": "2",
        "username": "alaeee123",
        "createdAt": "24 Jam",
        "image": "assets/images/tree.png",
        "avatar": "assets/images/logo.png",
        "like": "98",
        "dislike": "20",
        "comment": "60",
        "contentTittle": "Pohon Beringin"
      },
    ].map((json) => User.fromJson(json)).toList();

    super.onInit();
  }
}
