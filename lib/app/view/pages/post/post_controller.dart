// ignore_for_file: unused_field

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> pickImage() async {
    try {
      _image = await _picker.pickImage(source: ImageSource.gallery);
      if (_image == null) {
        return;
      }
    } catch (e) {
      print(e);
    }
  }

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
