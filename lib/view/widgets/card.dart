import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:thismed_app/view/themes/themes.dart';

class CsCard extends StatelessWidget {
  const CsCard({
    super.key,
    required this.id,
    required this.username,
    required this.contentTittle,
    required this.comment,
    required this.avatar,
    required this.like,
    required this.dislike,
    required this.createdAt,
    required this.image,
  });

  final String id;
  final String username;
  final String contentTittle;
  final String avatar;
  final String image;
  final String like;
  final String dislike;
  final String comment;
  final String createdAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor,
                      image: DecorationImage(
                          fit: BoxFit.fill, image: AssetImage(avatar))),
                ),
              ),
              const Gap(8),
              Text(
                username,
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Text(
                createdAt,
                style: greyTextStyle,
              ),
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
            contentTittle,
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
                // margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain, image: AssetImage(image))),
              ),
            ),
          ),
          const Gap(24),
          Row(
            children: [
              _buildAction(FontAwesomeIcons.thumbsUp, like),
              const Gap(8),
              _buildAction(FontAwesomeIcons.thumbsDown, dislike),
              const Gap(8),
              _buildAction(FontAwesomeIcons.comment, comment),
            ],
          ),
          const Gap(12),
          const Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildAction(IconData icon, String count) {
    return Row(
      children: [
        const Gap(14),
        Icon(
          icon,
          color: primaryTextColor,
          fill: 1,
        ),
        const Gap(6),
        Text(
          count,
          style:
              greyTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
