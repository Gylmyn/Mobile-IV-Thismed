import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thismed_app/app/data/services/services.dart';
import 'package:thismed_app/app/view/layout/constant/themes/themes.dart';
import 'package:thismed_app/app/view/layout/routes/routes_name.dart';

class SignUpController extends GetxController {
  final TextEditingController usernameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final TextEditingController confirmPasswordC = TextEditingController();
  final RxBool passwordSecure = true.obs;
  final RxBool confirmPasswordSecure = true.obs;
  final random = Random();
  final String characters =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890|!@#\$%^&*()_+';
  final RxString password = ''.obs;

  @override
  void onClose() {
    usernameC.clear();
    usernameC.dispose();
    emailC.clear();
    emailC.dispose();
    passwordC.clear();
    passwordC.dispose();
    confirmPasswordC.clear();
    confirmPasswordC.dispose();
    super.onClose();
  }

  void generatePassword() {
    final String result = password.value = List.generate(
        12, (index) => characters[random.nextInt(characters.length)]).join();
    passwordC.text = result;
  }

  Future<void> registerUser() async {
    try {
      if (passwordC.text.isNotEmpty &&
          confirmPasswordC.text.isNotEmpty &&
          emailC.text.isNotEmpty &&
          usernameC.text.isNotEmpty) {
        if (passwordC.text != confirmPasswordC.text) {
          Get.snackbar('Error', 'Password does not match');
        } else {
          await ApiCall.register(usernameC.text, emailC.text, passwordC.text);
          Get.snackbar(
            'Success',
            'Account created successfully',
            backgroundColor: successColor,
            colorText: primaryTextColor,
          );
          Get.offNamed(RouteName.SIGNIN);
        }
      }
      // Menampilkan pesan sukses menggunakan snackbar jika berhasil
    } catch (error) {
      // Menampilkan pesan error menggunakan snackbar jika gagal
      Get.snackbar(
          'Error', 'Failed to create account. Please try again later.');
    }
  }
}
