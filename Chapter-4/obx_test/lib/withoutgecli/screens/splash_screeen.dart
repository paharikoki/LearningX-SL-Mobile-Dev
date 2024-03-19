// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Splash Screen'),
            const SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
            const Text('Ini Harusnya Logo Aplikasi'),
          ],
        ),
      ),
    );
  }
}
