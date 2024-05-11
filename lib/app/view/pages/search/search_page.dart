import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:thismed_app/app/view/layout/constant/themes/themes.dart';
import 'package:thismed_app/app/view/layout/constant/widgets/button.dart';
import 'package:thismed_app/app/view/layout/constant/widgets/formfield.dart';
import 'package:thismed_app/app/view/pages/search/search_controller.dart';

class SearchPage extends GetView<SrcController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(),
    );
  }
}

PreferredSizeWidget _buildAppBar() {
  return AppBar(
    toolbarHeight: 70,
    shape: Border(
        bottom: BorderSide(
      color: primaryTextColor,
      width: 0.8,
    )),
    actions: <Widget>[
      const SizedBox(
        width: 200,
        child: CsFormField(
          placeholder: 'test',
          fullBorder: true,
        ),
      ),
      const Gap(12),
      SizedBox(
          width: 60,
          child: CsButton(
            title: '→',
            bgColor: primaryColor,
          )),
      const Gap(12),
    ],
    title: Text(
      'THISMED',
      style: greyTextStyle.copyWith(fontWeight: FontWeight.bold),
    ),
  );
}
