import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thismed_app/app/view/layout/constant/themes/themes.dart';

class CsFormField extends StatelessWidget {
  const CsFormField(
      {super.key,
      this.controller,
      required this.placeholder,
      this.textValidator,
      this.fullBorder = false});

  final TextEditingController? controller;
  final String placeholder;
  final bool? fullBorder;
  final String? textValidator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) => value == '' ? textValidator! : null,
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          filled: true,
          fillColor: fullBorder == true
              ? Colors.transparent
              : secondaryTextColor.withAlpha(40),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: fullBorder == true
              ? const OutlineInputBorder(
                  gapPadding: 0.0,
                  borderRadius: BorderRadius.all(Radius.circular(24)))
              : const OutlineInputBorder(borderSide: BorderSide.none),
          labelText: placeholder,
          labelStyle: grey2TextStyle,
        ));
  }
}
