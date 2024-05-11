import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:thismed_app/app/data/model/models.dart';
import 'package:thismed_app/app/view/layout/constant/themes/themes.dart';
import 'package:thismed_app/app/view/layout/constant/utils/date_formatting.dart';
import 'package:thismed_app/app/view/layout/constant/widgets/formfield.dart';
import 'package:thismed_app/app/view/layout/routes/routes_name.dart';

class CsCard extends StatelessWidget {
  const CsCard({
    super.key,
    required this.props,
  });
  final Users props;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: props.posts!.map((post) {
          return Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () =>
                          Get.toNamed(RouteName.USERPROFILE, arguments: props),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: primaryColor,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(props.avatar))),
                          ),
                          const Gap(8),
                          Text(
                            props.username,
                            style: primaryTextStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    CustomDateInitializeFormatting(
                        dateTime: post.createdAt, locale: LocaleDate.indonesia)
                  ],
                ),
                const Gap(12),
                const Divider(
                  thickness: 2,
                  endIndent: 20,
                  indent: 20,
                ),
                const Gap(12),
                Text(
                  post.title,
                  style: greyTextStyle.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const Gap(12),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 230,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(post.image))),
                    ),
                  ),
                ),
                const Gap(12),
                Row(
                  children: [
                    _buildAction(FontAwesomeIcons.thumbsUp, post.likes, () {}),
                    const Gap(4),
                    _buildAction(
                        FontAwesomeIcons.thumbsDown, post.dislikes, () {}),
                    const Gap(4),
                    _buildAction(
                        FontAwesomeIcons.comment,
                        post.comments.length,
                        () => openComment(post.title,
                            post.comments.length.toString(), post.comments)),
                  ],
                ),
                const Gap(12),
                const Divider(
                  thickness: 2,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildAction(IconData icon, int count, VoidCallback onPressed) {
    return Row(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          color: primaryTextColor,
        ),
        Text(
          count.toString(),
          style:
              greyTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}

Future<void> openComment(
    String postTittle, String commentCount, List<Comment> listComments) {
  return Get.bottomSheet(Container(
    width: double.infinity,
    color: bgColor,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            postTittle,
            style: greyTextStyle.copyWith(
                fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$commentCount Comment',
                style: greyTextStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Row(
                children: [
                  Text(
                    'terbaru',
                    style: greyTextStyle.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const Gap(12),
                  Text(
                    'populer',
                    style: greyTextStyle.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
              height: Get.height * .2,
              child: ListView.builder(
                itemCount: listComments.length,
                itemBuilder: (context, index) {
                  final comments = listComments[index];
                  return ListTile(
                    title: Text(comments.content),
                  );
                },
              )),
          const Spacer(),
          const SingleChildScrollView(
            child: CsFormField(
              placeholder: 'hallo world',
              fullBorder: true,
            ),
          )
        ],
      ),
    ),
  ));
}
