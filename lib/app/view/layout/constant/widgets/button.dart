import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:thismed_app/app/view/layout/constant/themes/themes.dart';

class CsButton extends StatelessWidget {
  const CsButton(
      {super.key,
      required this.title,
      this.onPressed,
      this.bgColor,
      this.useIcon = false,
      this.textOnly = false,
      this.icon});
  final String title;
  final Color? bgColor;
  final bool useIcon;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool textOnly;

  @override
  Widget build(BuildContext context) {
    return textOnly
        ? TextButton(
            onPressed: onPressed,
            child: Text(title,
                style: primaryTextStyle.copyWith(fontWeight: FontWeight.w500)),
          )
        : SizedBox(
            width: double.infinity,
            height: 50,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: bgColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: onPressed,
              child: useIcon
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icon),
                        const Gap(24),
                        Text(title,
                            style: whiteTextStyle.copyWith(
                                fontWeight: FontWeight.w500, fontSize: 20)),
                      ],
                    )
                  : Text(title,
                      style: whiteTextStyle.copyWith(
                          fontWeight: FontWeight.w500, fontSize: 20)),
            ),
          );
  }
}
