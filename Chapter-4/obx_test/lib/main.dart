// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obx_test/pages/bottomsheets.dart';
import 'package:obx_test/pages/dialog.dart';

import 'package:obx_test/pages/snack_bar.dart';
import 'package:obx_test/pages/uppercase_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(UpperCasePage());
              },
              child: const Text('Go to UpperCasePage'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(const SnackBarPage());
              },
              child: const Text('Go to SnackBarPage'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(const DialogPage());
              },
              child: const Text('Go to DialogPage'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(const BottomSheetsPage());
              },
              child: const Text('Go to BottomSheetsPage'),
            ),
          ],
        ),
      ),
    );
  }
}
