import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:thismed_app/view/themes/themes.dart';
import 'package:thismed_app/view/widgets/button.dart';
import 'package:thismed_app/view/widgets/formfield.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                icon: FontAwesomeIcons.user,
              ),
              const Gap(20),
              CsFormField(placeholder: 'Email', icon: Icons.mail_outlined),
              const Gap(20),
              CsFormField(
                placeholder: 'Password',
                icon: FontAwesomeIcons.lock,
              ),
              const Gap(38),
              CsButton(
                title: 'Sign Up',
                bgColor: primaryColor,
                onPressed: () {},
              ),
              const Gap(24),
              const Spacer(),
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
