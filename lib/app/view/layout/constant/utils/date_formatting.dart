import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:thismed_app/app/view/layout/constant/themes/themes.dart';

class CustomDateInitializeFormatting extends StatelessWidget {
  const CustomDateInitializeFormatting(
      {super.key, required this.dateTime, required this.locale});
  final DateTime dateTime;
  final String locale;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('id_ID', null);
    initializeDateFormatting('en_US', null);

    return Text(
      DateFormat.MMMMEEEEd(locale).format(dateTime),
      style: greyTextStyle,
    );
  }
}

class LocaleDate {
  static const String indonesia = 'id_ID';
  static const String english = 'en_US';
}
