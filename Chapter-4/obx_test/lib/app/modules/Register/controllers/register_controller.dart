import 'package:get/get.dart';

class RegisterController extends GetxController {
  final count = 0.obs;
  var email = ''.obs;
  var password = ''.obs;
  var fullName = ''.obs;

  var obscureText = true.obs;
  var checkBox = false.obs;

  void toggleCheckBox() {
    checkBox.value = !checkBox.value;
    update();
  }

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
    update();
  }

  void setEmail(String value) {
    email.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  void setFullName(String value) {
    fullName.value = value;
  }

  void increment() => count.value++;

  void handleRegister() {
    if (email.value.isEmpty) {
      Get.snackbar('Error', 'Email is required');
    } else if (password.value.isEmpty) {
      Get.snackbar('Error', 'Password is required');
    } else if (fullName.value.isEmpty) {
      Get.snackbar('Error', 'Fullname is required');
    } else if (!checkBox.value) {
      Get.snackbar('Error', 'Please accept terms and conditions');
    } else if (!email.value.isEmail) {
      Get.snackbar('Error', 'Invalid Email');
    } else if (password.value.length < 8) {
      Get.snackbar('Error', 'Password must be at least 8 characters');
    } else {
      Get.snackbar('Success', 'Registration Successful');
      Get.offAllNamed('/login');
    }
  }
}
