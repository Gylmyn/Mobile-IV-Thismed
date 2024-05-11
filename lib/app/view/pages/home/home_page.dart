import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:thismed_app/app/data/model/models.dart';
import 'package:thismed_app/app/view/layout/routes/routes_name.dart';
import 'package:thismed_app/app/view/pages/home/home_controller.dart';
// import 'package:thismed_app/app/data/model/user_model.dart';
import 'package:thismed_app/app/view/layout/constant/themes/themes.dart';
import 'package:thismed_app/app/view/layout/constant/widgets/card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeContentController controller = Get.put(HomeContentController());
    //alldata
    final RxList<Users> allData = controller.data;
    //sorted by likes
    final RxList<Users> sortDataByLikes = controller.sortDataByLikes;
    sortDataByLikes.sort((a, b) => b.posts!
        .map((post) => post.likes)
        .reduce((value, element) => value + element)
        .compareTo(a.posts!
            .map((post) => post.likes)
            .reduce((value, element) => value + element)));

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildDrawer(),
        appBar: _buildAppBar(),
        body: _buildBody(allData, sortDataByLikes, controller),
      ),
    );
  }
}

Widget _buildBody(RxList<Users> allData, RxList<Users> sortDataByLikes,
    HomeContentController controller) {
  return TabBarView(
    children: <Widget>[
      FutureBuilder(
        future: controller.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Obx(() => ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (context, index) {
                    final item = allData[index];
                    return CsCard(props: item);
                  },
                ));
          }
        },
      ),
      FutureBuilder(
        future: controller.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Obx(() => ListView.builder(
                  itemCount: sortDataByLikes.length,
                  itemBuilder: (context, index) {
                    final item = sortDataByLikes[index];
                    return CsCard(props: item);
                  },
                ));
          }
        },
      )
    ],
  );
}

PreferredSizeWidget _buildAppBar() {
  return AppBar(
    actions: const <Widget>[],
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
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 260,
            width: double.infinity,
            color: primaryColor,
            child: Container(
              margin: const EdgeInsets.only(
                  top: 30, bottom: 10, left: 10, right: 10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Text(
                        'v1.0.0',
                        style: whiteTextStyle,
                      )),
                ],
              ),
            ),
          ),
          const Gap(8),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('User Profile',
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  ListTile(
                    leading: Image.asset(
                      'assets/images/user.png',
                      width: 36,
                      height: 36,
                    ),
                    title: Text(
                      'Profile',
                      style: greyTextStyle,
                    ),
                    onTap: () => Get.toNamed(RouteName.USERPROFILE),
                  ),
                  const Gap(12),
                  Text('Telusuri',
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  Column(
                    children: [
                      ListTile(
                        leading: Image.asset(
                          'assets/images/random.png',
                          width: 36,
                          height: 36,
                        ),
                        title: Text(
                          'Random',
                          style: greyTextStyle,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Image.asset(
                          'assets/images/meme.png',
                          width: 36,
                          height: 36,
                        ),
                        title: Text(
                          'Meme',
                          style: greyTextStyle,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Image.asset(
                          'assets/images/music.png',
                          width: 36,
                          height: 36,
                        ),
                        title: Text(
                          'Music',
                          style: greyTextStyle,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Image.asset(
                          'assets/images/dice.png',
                          width: 36,
                          height: 36,
                        ),
                        title: Text(
                          'Game',
                          style: greyTextStyle,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    ),
  );
}

  // RxList<User> sortedList = RxList.from(items.listContent);
  // sortedList.sort((a, b) => b.like.compareTo(a.like));
  // return TabBarView(
  //   children: <Widget>[
  //     Obx(() => ListView.builder(
  //           itemCount: items.listContent.length,
  //           itemBuilder: (context, index) {
  //             final item = items.listContent[index];
  //             return CsCard(props: item);
  //           },
  //         )),
  //     Obx(() => ListView.builder(
  //           itemCount: sortedList.length,
  //           itemBuilder: (context, index) {
  //             final item = sortedList[index];
  //             return CsCard(props: item);
  //           },
  //         )),
  //   ],
  // );
