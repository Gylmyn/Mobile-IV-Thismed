import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:thismed_app/app/view/layout/routes/routes_name.dart';
import 'package:thismed_app/app/view/layout/constant/themes/themes.dart';
import 'package:thismed_app/app/view/layout/constant/widgets/button.dart';
import 'package:thismed_app/app/view/layout/constant/widgets/formfield.dart';
import 'package:thismed_app/app/view/pages/auth/sign_in/sign_in_controller.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Form(
            key: key,
            child: SingleChildScrollView(
              child: Column(
                // physics: const NeverScrollableScrollPhysics(),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(140),
                  Text(
                    'Sign In',
                    style: greyTextStyle.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 64),
                  ),
                  const Gap(30),
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
                  Obx(() => CsFormField(
                        obsecureText: controller.passwordSecure.value,
                        suffixIcon: Obx(() => IconButton(
                              padding: const EdgeInsets.only(right: 6),
                              icon: FaIcon(
                                size: 20,
                                controller.passwordSecure.value
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                color: secondaryTextColor,
                              ),
                              onPressed: () {
                                controller.passwordSecure.toggle();
                              },
                            )),
                        placeholder: 'Enter Your Password',
                        textValidator: 'Password cannot be empty',
                        controller: controller.passwordC,
                      )),
                  const Gap(38),
                  CsButton(
                    title: 'Sign In',
                    bgColor: primaryColor,
                    textStyle: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 20),
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        controller.loginUser();
                      }
                    },
                  ),
                  const Gap(24),
                  const Center(
                    child: Text(
                      'Or',
                    ),
                  ),
                  const Gap(18),
                  CsButton(
                    title: 'Google',
                    useBorder: true,
                    useIcon: true,
                    icon: 'assets/images/google-logo.png',
                    borderColor: primaryColor,
                    textStyle: primaryTextStyle.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  const Gap(18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don`t Have an Account ? ',
                          style: greyTextStyle.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 16)),
                      CsButton(
                        title: 'Sign Up',
                        textStyle: primaryTextStyle.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 16),
                        textOnly: true,
                        onPressed: () => Get.toNamed(RouteName.SIGNUP),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
