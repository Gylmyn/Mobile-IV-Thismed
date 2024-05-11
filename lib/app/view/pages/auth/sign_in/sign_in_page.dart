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
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Form(
            key: key,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(140),
                Text(
                  'Sign In',
                  style: greyTextStyle.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 64),
                ),
                const Gap(30),
                CsFormField(
                  placeholder: 'Gmail',
                  controller: controller.emailC,
                  icon: Icons.mail_outlined,
                ),
                const Gap(20),
                CsFormField(
                  placeholder: 'Password',
                  controller: controller.passwordC,
                  icon: FontAwesomeIcons.key,
                ),
                const Gap(38),
                CsButton(
                  title: 'Sign In',
                  bgColor: primaryColor,
                  onPressed: () => controller.loginUser(),
                ),
                const Gap(24),
                const Center(
                  child: Text(
                    'Or',
                  ),
                ),
                const Gap(18),
                CsButton(
                  useIcon: true,
                  icon: FontAwesomeIcons.google,
                  title: 'Google',
                  bgColor: primaryColor,
                  onPressed: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don`t Have an Account ? '),
                    CsButton(
                      title: 'Sign Up',
                      textOnly: true,
                      onPressed: () => Get.toNamed(RouteName.SIGNUP),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
