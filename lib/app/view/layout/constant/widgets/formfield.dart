import 'package:flutter/material.dart';
import 'package:thismed_app/app/view/layout/constant/themes/themes.dart';

class CsFormField extends StatelessWidget {
  const CsFormField(
      {super.key, this.controller, this.icon, required this.placeholder});

  final TextEditingController? controller;
  final String placeholder;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: placeholder,
          labelStyle: grey2TextStyle,
          prefixIcon: Icon(
            icon,
            size: 20,
          ),
        ));
  }
}
