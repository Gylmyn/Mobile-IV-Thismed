import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thismed_app/app/view/layout/constant/themes/themes.dart';
import 'package:thismed_app/app/view/layout/constant/widgets/button.dart';
import 'package:thismed_app/app/view/layout/constant/widgets/formfield.dart';
import 'package:thismed_app/app/view/pages/post/post_controller.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PostController controller = Get.put(PostController());
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(controller),
    );
  }

  Widget _buildBody(PostController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SingleChildScrollView(
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
              placeholder: 'Masukkan judul postingan........',
            ),
            const Gap(25),
            Text(
              'Tambah Gambar',
              style: greyTextStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Gap(12),
            GestureDetector(
              onTap: () => controller.pickImage(),
              child: DottedBorder(
                color: secondaryTextColor,
                radius: const Radius.circular(12),
                borderType: BorderType.RRect,
                strokeWidth: 2,
                dashPattern: const [9, 4],
                child: GetBuilder<PostController>(
                    builder: (c) => c.image != null
                        ? Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: FileImage(File(c.image!.path)),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                        onPressed: () => c.clearImage(),
                                        icon: const Icon(
                                          CupertinoIcons.clear_circled_solid,
                                        ),
                                        color: Colors.red)),
                              ),
                              CsButton(
                                title: 'Upload',
                                onPressed: () => c.uploadImage(),
                                textOnly: true,
                                textStyle: primaryTextStyle,
                              ),
                            ],
                          )
                        : SizedBox(
                            width: double.infinity,
                            height: 300,
                            child: Center(
                              child: Icon(
                                Icons.photo_size_select_actual_outlined,
                                size: 80,
                                color: secondaryTextColor,
                              ),
                            ))),
              ),
            )
          ],
        ),
      ),
    );
  }
}

PreferredSizeWidget _buildAppBar() {
  return AppBar(
    toolbarHeight: 70,
    shape: Border(
        bottom: BorderSide(
      color: secondaryTextColor,
      width: 1,
    )),
    actions: const <Widget>[],
    title: Text(
      'THISMED',
      style: greyTextStyle.copyWith(fontWeight: FontWeight.bold),
    ),
  );
}

// PreferredSizeWidget _buildAppBar() {
//   return AppBar(
//     // toolbarHeight: 2170,
//     shape: Border(
//         bottom: BorderSide(
//       color: primaryTextColor,
//       width: 1,
//     )),
//     actions: <Widget>[
//       IconButton(
//           onPressed: () {},
//           icon: const Icon(
//             Icons.menu_sharp,
//             size: 30,
//           )),
//       // const Gap(20),
//     ],
//     title: Text(
//       'THISMED',
//       style: greyTextStyle.copyWith(fontWeight: FontWeight.bold),
//     ),
//   );
// }

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
