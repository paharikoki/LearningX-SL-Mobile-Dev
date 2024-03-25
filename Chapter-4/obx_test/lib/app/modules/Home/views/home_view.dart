import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Selamat Datang Di Indomaret!'),
        const Text('Selamat Berbelanja!'),
        const SizedBox(
          height: 90,
        ),
        ElevatedButton(
            onPressed: () => Get.toNamed('/category'),
            child: const Text('category')),
        ElevatedButton(
            onPressed: () => Get.offAllNamed('/login'),
            child: const Text('Logout'))
      ],
    )));
  }
}
