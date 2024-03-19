// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class UpperCasePage extends StatelessWidget {
  var user = "Hayooo!!".obs;
  RxInt fontSize = 20.obs;
  Rx<Color> backgroundColor = Colors.white.obs;

  UpperCasePage({super.key});
  void ubah() {
    if (user.value == user.value.toUpperCase()) {
      user.value = user.value.toLowerCase();
      increaseFontSize();
      return;
    }
    user.value = user.value.toUpperCase();
  }

  void reset() {
    user.value = "Hayooo!!";
    fontSize.value = 20;
  }

  void increaseFontSize() {
    fontSize.value = fontSize.value * 2;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
          title: const Text('Test Get X'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => reset(),
          child: const Icon(Icons.restart_alt),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(
                    '$user',
                    style: TextStyle(fontSize: fontSize.value.toDouble()),
                  )),
              ElevatedButton(
                onPressed: () =>
                    ubah(), // Assuming ubah is the function to change the text
                child: const Text('Ubah Text'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
