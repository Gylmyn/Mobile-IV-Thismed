import 'package:get/get.dart';

class PostController extends GetxController {
  static PostController get to => Get.find<PostController>();

  // final ImagePicker _picker = ImagePicker();
  // XFile? _image;

  // XFile? image;
  // String? imagePath;
  // final _picker = ImagePicker();

  // Future<void> getImage() async {
  //   final pickedFile = await _picker.pickImage(source: ImageSource.camera);

  //   if (pickedFile != null) {
  //     image = XFile(pickedFile.path);
  //     imagePath = pickedFile.path;
  //     print(imagePath);
  //     update();
  //   } else {
  //     print('No image selected.');
  //   }
  // }
}
