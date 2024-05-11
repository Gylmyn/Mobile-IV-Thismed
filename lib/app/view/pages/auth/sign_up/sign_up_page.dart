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
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(100),
              Text(
                'Sign Up',
                style: greyTextStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 64),
              ),
              const Gap(30),
              CsFormField(
                placeholder: 'Username',
                controller: controller.usernameC,
                icon: FontAwesomeIcons.user,
              ),
              const Gap(20),
              CsFormField(
                  placeholder: 'Email',
                  controller: controller.emailC,
                  icon: Icons.mail_outlined),
              const Gap(20),
              CsFormField(
                placeholder: 'Password',
                controller: controller.passwordC,
                icon: FontAwesomeIcons.lock,
              ),
              const Gap(38),
              CsButton(
                title: 'Sign Up',
                bgColor: primaryColor,
                onPressed: () => controller.registerUser(),
              ),
              const Gap(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don`t Have an Account ? '),
                  CsButton(
                    title: 'Sign In',
                    textOnly: true,
                    onPressed: () => Get.back(),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
