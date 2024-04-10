import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'post_controller.dart';

class PostPage extends GetView<PostController> {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PostPage'),
      ),
      body: Container(),
    );
  }
}
