import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:thismed_app/app/data/model/user_model.dart';
import 'package:thismed_app/app/view/layout/constant/themes/themes.dart';

class CsCard extends StatelessWidget {
  const CsCard({
    super.key,
    required this.props,
  });
  final User props;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('id_ID', null);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  print('Avatar Clicked');
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor,
                      image: DecorationImage(
                          fit: BoxFit.fill, image: AssetImage(props.avatar))),
                ),
              ),
              const Gap(8),
              Text(
                props.username,
                style: primaryTextStyle.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Text(
                DateFormat.MMMMEEEEd('id_ID').format(props.createdAt),
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
            props.contentTittle,
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
                        fit: BoxFit.contain, image: AssetImage(props.image))),
              ),
            ),
          ),
          const Gap(12),
          Row(
            children: [
              _buildAction(FontAwesomeIcons.thumbsUp, props.like, () {}),
              _buildAction(FontAwesomeIcons.thumbsDown, props.dislike, () {}),
              _buildAction(FontAwesomeIcons.comment, props.comment, () {}),
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

  Widget _buildAction(IconData icon, int count, VoidCallback onPressed) {
    return Row(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          color: primaryTextColor,
        ),
        const Gap(4),
        Text(
          count.toString(),
          style:
              greyTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
