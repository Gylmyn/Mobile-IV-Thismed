import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:thismed_app/app/data/model/models.dart';
import 'package:thismed_app/app/view/layout/constant/themes/themes.dart';
import 'profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Users props = Get.arguments;
    return Scaffold(appBar: _buildAppBar(), body: _buildBody(props));
  }
}

Widget _buildBody(Users props) {
  return Column(
    children: [
      const Gap(20),
      _buildProfile(
          props.username.isEmpty || props.username == ''
              ? 'unknown'
              : props.username,
          'Super Great Delicious,',
          props.avatar.isEmpty || props.avatar == ''
              ? 'assets/images/avatar-3.png'
              : props.avatar),
      // _buildUserPost(props.posts!.length.toString())
    ],
  );
}

Widget _buildProfile(String username, String bio, String avaImage) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: ListTile(
      tileColor: primaryColor.withAlpha(80),
      title: Row(
        children: [
          Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
                border: Border.all(color: bgColor, width: 3),
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(avaImage))),
          ),
          const Gap(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '@$username',
                style: whiteTextStyle.copyWith(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(bio)
            ],
          ),
        ],
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.ellipsis_circle_fill,
            size: 40,
            fill: 1,
            color: bgColor,
          )),
    ),
  );
}

Widget _buildUserPost(String postCount) {
  return Column(
    children: [Text('Semua Postingan $postCount')],
  );
}

// Widget _buildProfile(String username, String bio, String avaImage) {
//   return Container(
//     padding: const EdgeInsets.symmetric(vertical: 20),
//     width: Get.width,
//     decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 10,
//             offset: Offset(4, 10),
//           )
//         ]),
//     child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 30),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: 120,
//                 height: 120,
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     image: DecorationImage(
//                         fit: BoxFit.fill, image: AssetImage(avaImage))),
//               ),
//               const Gap(12),
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: primaryColor,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Text(
//                   '@$username',
//                   style: whiteTextStyle.copyWith(
//                       fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               const Gap(8),
//               Container(
//                 constraints: const BoxConstraints(maxWidth: 236),
//                 child: Text(
//                   bio,
//                   style: greyTextStyle.copyWith(
//                       fontSize: 14, fontWeight: FontWeight.w500),
//                 ),
//               ),
//               const Gap(16),
//               // const Divider(
//               //   thickness: 2,
//               //   // endIndent: 80,
//               //   // indent: 20,
//               // ),
//             ],
//           ),
//           _buildLabel()
//         ],
//       ),
//     ),
//   );
// }

Widget _buildLabel() {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(4, 10),
          )
        ]),
    child: Column(
      children: [
        Text(
          'T',
          style: whiteTextStyle.copyWith(
              fontSize: 16, fontWeight: FontWeight.w700),

          // textAlign: TextAlign.center,
        ),
        Text(
          'H',
          style: whiteTextStyle.copyWith(
              fontSize: 16, fontWeight: FontWeight.w700),

          // textAlign: TextAlign.center,
        ),
        Text(
          'I',
          style: whiteTextStyle.copyWith(
              fontSize: 16, fontWeight: FontWeight.w700),

          // textAlign: TextAlign.center,
        ),
        Text(
          'S',
          style: whiteTextStyle.copyWith(
              fontSize: 16, fontWeight: FontWeight.w700),

          // textAlign: TextAlign.center,
        ),
        Text(
          'M',
          style: whiteTextStyle.copyWith(
              fontSize: 16, fontWeight: FontWeight.w700),

          // textAlign: TextAlign.center,
        ),
        Text(
          'E',
          style: whiteTextStyle.copyWith(
              fontSize: 16, fontWeight: FontWeight.w700),

          // textAlign: TextAlign.center,
        ),
        Text(
          'D',
          style: whiteTextStyle.copyWith(
              fontSize: 16, fontWeight: FontWeight.w700),

          // textAlign: TextAlign.center,
        ),
      ],
    ),
  );
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
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu_sharp,
            size: 30,
          )),
      const Gap(20),
    ],
    title: Text(
      'THISMED',
      style: greyTextStyle.copyWith(fontWeight: FontWeight.bold),
    ),
  );
}
