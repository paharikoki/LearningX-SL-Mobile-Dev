import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/app/routes/app_pages.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 135,
          ),
          Center(
            child: Container(
              height: 320,
              width: 320,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Set border color here
                    width: 0.8, // Set border width here
                  ),
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/bg_splash.png',
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Discover Our',
            style: GoogleFonts.playfairDisplay(
              fontSize: 42,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100, // Set the width of the container
                height: 30, // Set the height of the container
                child: Image.asset(
                  'assets/images/text_bg_splash.jpg',
                  fit: BoxFit.cover, // Fit the image within the container
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Food World!',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 42,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Find the best food for your health',
            style: TextStyle(fontSize: 18),
          ),
          const Text(
            'Eazy to cook and delicious to eat!',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 110,
          ),
          GestureDetector(
            onTap: () {
              Get.offAllNamed(Routes.HOME);
            },
            child: SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.all(15),
                color: Colors.black,
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
