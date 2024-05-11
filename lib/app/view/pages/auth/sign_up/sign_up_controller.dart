import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thismed_app/app/data/services/services.dart';
import 'package:thismed_app/app/view/layout/constant/themes/themes.dart';
import 'package:thismed_app/app/view/layout/routes/routes_name.dart';

class SignUpController extends GetxController {
  final TextEditingController usernameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  @override
  void onClose() {
    usernameC.clear();
    usernameC.dispose();
    emailC.clear();
    emailC.dispose();
    passwordC.clear();
    passwordC.dispose();
    super.onClose();
  }

  void registerUser() async {
    try {
      await ApiCall.register(usernameC.text, emailC.text, passwordC.text);
      // Menampilkan pesan sukses menggunakan snackbar jika berhasil
      Get.snackbar(
        'Success',
        'Account created successfully',
        backgroundColor: successColor,
        colorText: primaryTextColor,
      );
      Get.offNamed(RouteName.SIGNIN);
    } catch (error) {
      // Menampilkan pesan error menggunakan snackbar jika gagal
      Get.snackbar(
          'Error', 'Failed to create account. Please try again later.');
    }
  }
}
