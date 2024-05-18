// ignore_for_file: unused_field

import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostController extends GetxController {
  final storage = FirebaseStorage.instance.ref();
  final ImagePicker _picker = ImagePicker();
  XFile? image;

  Future<void> uploadImage() async {
    final ref = storage.child(image!.name);
    File file = File(image!.path);
    try {
      final dataUpload = await ref.putFile(file);
      log(dataUpload.toString());
    } catch (e) {
      log(e.toString());
    }
    update();
  }

  void clearImage() {
    image = null;
    update();
  }

  Future<void> pickImage() async {
    try {
      image = await _picker.pickImage(source: ImageSource.gallery);
      update();
      if (image != null) {
        log(image!.name);
        log(image!.path);
        // return;
      }
    } catch (e) {
      image = null;
      update();
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
