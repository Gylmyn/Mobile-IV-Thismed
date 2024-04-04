import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:thismed_app/controllers/content_ctrl.dart';
import 'package:thismed_app/view/themes/themes.dart';
import 'package:thismed_app/view/widgets/card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ContentController controller = Get.put(ContentController());

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildDrawer(),
        appBar: _buildAppBar(),
        body: _buildBody(controller),
      ),
    );
  }
}

Widget _buildBody(ContentController items) {
  return TabBarView(
    children: <Widget>[
      Obx(() => ListView.builder(
            itemCount: items.listContent.length,
            itemBuilder: (context, index) {
              final item = items.listContent[index];
              return CsCard(
                  id: item.id,
                  username: item.username,
                  contentTittle: item.contentTittle,
                  comment: item.comment,
                  avatar: item.avatar,
                  like: item.like,
                  dislike: item.dislike,
                  createdAt: item.createdAt,
                  image: item.image);
            },
          )),
      Obx(() => ListView.builder(
            itemCount: items.listContent.length,
            itemBuilder: (context, index) {
              final item =
                  items.listContent[items.listContent.length - index - 1];
              return CsCard(
                  id: item.id,
                  username: item.username,
                  contentTittle: item.contentTittle,
                  comment: item.comment,
                  avatar: item.avatar,
                  like: item.like,
                  dislike: item.dislike,
                  createdAt: item.createdAt,
                  image: item.image);
            },
          )),
    ],
  );
}

PreferredSizeWidget _buildAppBar() {
  return AppBar(
    title: Text(
      'THISMED',
      style: greyTextStyle.copyWith(fontWeight: FontWeight.bold),
    ),
    bottom: TabBar(
      tabs: const <Widget>[
        Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.bell),
              Gap(12),
              Text('Terbaru'),
            ],
          ),
        ),
        Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.fire),
              Gap(12),
              Text('Populer'),
            ],
          ),
        ),
      ],
      labelColor: primaryColor,
      indicatorColor: primaryColor,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: 4,
    ),
  );
}

Widget _buildDrawer() {
  return Drawer(
    backgroundColor: bgColor,
    shape: const OutlineInputBorder(borderSide: BorderSide.none),
    child: Column(
      children: [
        Container(
          height: 260,
          width: double.infinity,
          color: primaryColor,
          child: Container(
            margin: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
