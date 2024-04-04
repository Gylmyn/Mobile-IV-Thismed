import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:thismed_app/routes/routes_name.dart';
import 'package:thismed_app/view/themes/themes.dart';
import 'package:thismed_app/view/widgets/button.dart';
import 'package:thismed_app/view/widgets/formfield.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(140),
              Text(
                'Sign In',
                style: greyTextStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 64),
              ),
              const Gap(30),
              CsFormField(
                placeholder: 'Username',
                icon: FontAwesomeIcons.user,
              ),
              const Gap(20),
              CsFormField(
                placeholder: 'Password',
                icon: FontAwesomeIcons.key,
              ),
              const Gap(38),
              CsButton(
                title: 'Sign In',
                bgColor: primaryColor,
                onPressed: () {},
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
              const Spacer(),
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
    );
  }
}
