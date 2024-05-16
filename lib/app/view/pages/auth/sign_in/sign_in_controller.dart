import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thismed_app/app/data/services/services.dart';
import 'package:thismed_app/app/view/layout/constant/themes/themes.dart';
import 'package:thismed_app/app/view/layout/routes/routes_name.dart';

class SignInController extends GetxController {
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  @override
  void onClose() {
    emailC.clear();
    emailC.dispose();
    passwordC.clear();
    passwordC.dispose();
    super.onClose();
  }

  void loginUser() async {
    try {
      if (emailC.text.isEmpty && passwordC.text.isEmpty) {
        Get.snackbar('error', 'Please fill in the form');
      } else {
        await ApiCall.login(emailC.text, passwordC.text);
        Get.snackbar(
          'Success',
          'Login successfully, Hallo',
          backgroundColor: successColor,
          colorText: primaryTextColor,
        );
        Get.offAllNamed(RouteName.BOTNAVBAR);
      }
      // Menampilkan pesan sukses menggunakan snackbar jika berhasil
    } catch (error) {
      // Menampilkan pesan error menggunakan snackbar jika gagal
      Get.snackbar(
          'Error', 'Failed to create account. Please try again later.');
    }
  }
}
