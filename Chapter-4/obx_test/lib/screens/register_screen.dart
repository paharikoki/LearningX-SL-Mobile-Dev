import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class RegisterController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var fullName = ''.obs;

  void setEmail(String value) {
    email.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  void setFullName(String value) {
    fullName.value = value;
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  final registerController = Get.put(RegisterController());
  bool obscureText = true;
  bool checkBox = false;
  @override
  void dispose() {
    Get.delete<RegisterController>();
    super.dispose();
  }

  void handleRegister() {
    if (registerController.email.value.isEmpty) {
      Get.snackbar('Error', 'Email is required');
    } else if (registerController.password.value.isEmpty) {
      Get.snackbar('Error', 'Password is required');
    } else if (registerController.fullName.value.isEmpty) {
      Get.snackbar('Error', 'Fullname is required');
    } else if (!checkBox) {
      Get.snackbar('Error', 'Please accept terms and conditions');
    } else if (!registerController.email.value.isEmail) {
      Get.snackbar('Error', 'Invalid Email');
    } else if (registerController.password.value.length < 8) {
      Get.snackbar('Error', 'Password must be at least 8 characters');
    } else {
      Get.snackbar('Success', 'Registration Successful');
      Get.offAllNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              imageBackground(),
              registerForm(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: signUpButton(),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  Positioned imageBackground() {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(
                'assets/images/Polygon.png',
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            Expanded(
                child: SizedBox(
              height: 2,
              width: double.infinity,
              child: Container(
                color: Colors.white,
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget signUpButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Already have an account?",
              style: TextStyle(
                fontWeight: FontWeight.w300,
              )),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              Get.offAllNamed('/login');
            },
            child: const Text(
              "Log In",
              style: TextStyle(
                  fontWeight: FontWeight.w700, color: Colors.blueAccent),
            ),
          ),
        ],
      ),
    );
  }

  Padding registerForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                'Create an Account.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  letterSpacing: 1.0,
                ),
              ),
              Text(
                '✨',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            'Welcome! Please enter Your Details.',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
          ),
          const SizedBox(height: 30),
          Form(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: "Fullname",
                        hintText: "Enter your fullname",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) =>
                          registerController.setFullName(value),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        labelText: "Email",
                        hintText: "Enter your email",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => registerController.setEmail(value),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        labelText: "Password",
                        hintText: "***********",
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          icon: Icon(obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                      onChanged: (value) =>
                          registerController.setPassword(value),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: checkBox,
                            onChanged: (value) {
                              setState(() {
                                checkBox = value ?? false;
                              });
                            },
                          ),
                          const Text(
                            'Accept Terms & Conditions',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    child: Stack(
                      children: [
                        Positioned.fill(
                            child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFD75045),
                                  Color(0xFF7F3F89),
                                ]),
                          ),
                        )),
                        TextButton(
                          onPressed: () {
                            handleRegister();
                          },
                          child: const Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: () {
                      null;
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(11),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                          width: 1,
                          color: Colors.white), // Add this line for outline
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.asset(
                              'assets/icons/Google_Icons.png',
                            ),
                          ),
                          const SizedBox(
                              width:
                                  8), // Add some spacing between icon and text
                          const Text(
                            "Log In with Google",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: () {
                      null;
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(11),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                          width: 1,
                          color: Colors.white), // Add this line for outline
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                              'assets/icons/Facebook_Icons.png',
                            ),
                          ),
                          const SizedBox(
                              width:
                                  10), // Add some spacing between icon and text
                          const Text(
                            "Log In with Facebook",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
