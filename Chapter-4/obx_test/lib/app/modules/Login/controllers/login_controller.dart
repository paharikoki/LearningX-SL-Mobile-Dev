import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final count = 0.obs;
  var email = ''.obs;
  var password = ''.obs;
  var obscureText = true.obs;
  var checkBox = false.obs;

  void setEmail(String value) {
    email.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  void toggleCheckBox() {
    checkBox.value = !checkBox.value;
    update();
  }

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
    update();
  }

  void handleLogin() {
    const String hardcodedEmail = 'mail@mail.com';
    const String hardcodedPassword = '12345678';

    final email = this.email.value;
    final password = this.password.value;

    if (email.toLowerCase() == hardcodedEmail &&
        password == hardcodedPassword) {
      Get.snackbar('Success', 'Log In Successful');
      Get.offAllNamed('/home');
    } else {
      Get.defaultDialog(
        title: 'Login Error',
        middleText: 'Invalid email or password.',
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
        ],
      );
    }
  }

  void increment() => count.value++;
}
