import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './setup_user_controller.dart';

class SetupUserPage extends GetView<SetupUserController> {
    
    const SetupUserPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('SetupUserPage'),),
            body: Container(),
        );
    }
}