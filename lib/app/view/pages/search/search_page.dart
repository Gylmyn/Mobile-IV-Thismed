import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:thismed_app/app/view/pages/search/search_controller.dart';

class SearchPage extends GetView<SrcController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchPage'),
      ),
      body: Container(),
    );
  }
}
