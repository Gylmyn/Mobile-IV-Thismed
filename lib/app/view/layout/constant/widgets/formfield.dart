import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thismed_app/app/view/layout/constant/themes/themes.dart';

class CsFormField extends StatelessWidget {
  const CsFormField(
      {super.key,
      this.controller,
      this.icon,
      required this.placeholder,
      this.fullBorder = false});

  final TextEditingController? controller;
  final String placeholder;
  final IconData? icon;
  final bool? fullBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 12),
          floatingLabelBehavior: fullBorder == true
              ? FloatingLabelBehavior.never
              : FloatingLabelBehavior.auto,
          border: fullBorder == true
              ? const OutlineInputBorder(
                  gapPadding: 0.0,
                  borderRadius: BorderRadius.all(Radius.circular(24)))
              : const UnderlineInputBorder(),
          labelText: placeholder,
          labelStyle: grey2TextStyle,
          prefixIcon: Icon(
            icon,
            size: 20,
          ),
        ));
  }
}
