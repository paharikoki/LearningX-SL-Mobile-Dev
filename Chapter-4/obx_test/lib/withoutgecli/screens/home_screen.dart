import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            onPressed: () => Get.offAllNamed('/login'),
            child: const Text('Logout'))
      ],
    )));
  }
}
