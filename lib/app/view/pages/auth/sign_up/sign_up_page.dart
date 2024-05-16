import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thismed_app/app/view/layout/constant/themes/themes.dart';
import 'package:thismed_app/app/view/layout/constant/widgets/button.dart';
import 'package:thismed_app/app/view/layout/constant/widgets/formfield.dart';
import 'package:thismed_app/app/view/pages/auth/sign_up/sign_up_controller.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<FormState>();

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: key,
          child: SingleChildScrollView(
            child: Column(
              // physics: const NeverScrollableScrollPhysics(),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(100),
                Text(
                  'Sign Up',
                  style: greyTextStyle.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 64),
                ),
                const Gap(30),
                Text(
                  'Username',
                  style: greyTextStyle.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const Gap(10),
                CsFormField(
                  placeholder: 'Enter Your Username',
                  textValidator: 'Username cannot be empty',
                  controller: controller.usernameC,
                ),
                const Gap(20),
                Text(
                  'Email',
                  style: greyTextStyle.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const Gap(10),
                CsFormField(
                  placeholder: 'Enter Your Email',
                  textValidator: 'Email cannot be empty',
                  controller: controller.emailC,
                ),
                const Gap(20),
                Text(
                  'Password',
                  style: greyTextStyle.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const Gap(10),
                CsFormField(
                  placeholder: 'Enter Your Password',
                  textValidator: 'Password cannot be empty',
                  controller: controller.passwordC,
                ),
                const Gap(20),
                Text(
                  'Confirm Password',
                  style: greyTextStyle.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const Gap(10),
                CsFormField(
                  placeholder: 'Confirm Your Password',
                  textValidator: 'Password cannot be empty',
                  controller: controller.confirmPasswordC,
                ),
                const Gap(38),
                CsButton(
                  title: 'Sign Up',
                  bgColor: primaryColor,
                  textStyle: whiteTextStyle.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 20),
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      // controller.checkPassword();
                      controller.registerUser();
                    }
                  },
                ),
                const Gap(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already Have an Account ? ',
                        style: greyTextStyle.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 16)),
                    CsButton(
                      title: 'Sign In',
                      textStyle: primaryTextStyle.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 16),
                      textOnly: true,
                      onPressed: () => Get.back(),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
