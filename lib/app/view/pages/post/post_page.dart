import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:thismed_app/app/view/layout/constant/themes/themes.dart';
import 'package:thismed_app/app/view/layout/constant/widgets/formfield.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildAppBar(),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(12),
          Text('Tambah Postingan',
              style: primaryTextStyle.copyWith(
                  fontSize: 24, fontWeight: FontWeight.bold)),
          const Gap(25),
          _buildTitleAndDesc(
              'Judul', 'masukkan judul postingan (minimal 4 karakter)'),
          const Gap(12),
          const CsFormField(
            fullBorder: true,
            icon: CupertinoIcons.pencil_slash,
            placeholder: 'Masukkan judul postingan........',
          ),
          const Gap(25),
          Text(
            'Tambah Gambar',
            style: greyTextStyle.copyWith(
                fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Gap(12),
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
                border: Border.all(color: primaryTextColor),
                borderRadius: BorderRadius.circular(12)),
          )
        ],
      ),
    );
  }
}

PreferredSizeWidget _buildAppBar() {
  return AppBar(
    // toolbarHeight: 2170,
    shape: Border(
        bottom: BorderSide(
      color: primaryTextColor,
      width: 1,
    )),
    actions: <Widget>[
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu_sharp,
            size: 30,
          )),
      // const Gap(20),
    ],
    title: Text(
      'THISMED',
      style: greyTextStyle.copyWith(fontWeight: FontWeight.bold),
    ),
  );
}

Widget _buildTitleAndDesc(String tittle, String desc) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(tittle,
          style: greyTextStyle.copyWith(
              fontSize: 24, fontWeight: FontWeight.bold)),
      Text(desc,
          style: grey2TextStyle.copyWith(
              fontSize: 16, fontWeight: FontWeight.w500)),
    ],
  );
}
