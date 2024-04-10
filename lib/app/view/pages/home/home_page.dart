import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:thismed_app/app/view/pages/home/home_controller.dart';
import 'package:thismed_app/app/data/model/user_model.dart';
import 'package:thismed_app/app/view/layout/constant/themes/themes.dart';
import 'package:thismed_app/app/view/layout/constant/widgets/card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeContentController controller = Get.put(HomeContentController());

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

Widget _buildBody(HomeContentController items) {
  RxList<User> sortedList = RxList.from(items.listContent);
  sortedList.sort((a, b) => b.like.compareTo(a.like));
  return TabBarView(
    children: <Widget>[
      Obx(() => ListView.builder(
            itemCount: items.listContent.length,
            itemBuilder: (context, index) {
              final item = items.listContent[index];
              return CsCard(props: item);
            },
          )),
      Obx(() => ListView.builder(
            itemCount: sortedList.length,
            itemBuilder: (context, index) {
              final item = sortedList[index];
              return CsCard(props: item);
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
