import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: GetBuilder<LoginController>(builder: (controller) {
        return SafeArea(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  imageBackground(),
                  loginForm(),
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
        );
      }),
    );
  }

  Positioned imageBackground() {
    return Positioned(
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
    ));
  }

  Widget signUpButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Don't have an account?",
              style:
                  TextStyle(fontWeight: FontWeight.w300, color: Colors.white)),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              Get.offAllNamed('/register');
            },
            child: const Text(
              "Sign Up",
              style: TextStyle(
                  fontWeight: FontWeight.w700, color: Colors.blueAccent),
            ),
          ),
        ],
      ),
    );
  }

  Padding loginForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                'Login With Your Account.',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    letterSpacing: 1.0,
                    color: Colors.white),
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
            'Welcome Back! Please enter Your Details.',
            style: TextStyle(
                fontWeight: FontWeight.w300, color: Colors.grey, fontSize: 16),
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
                        prefixIcon: Icon(Icons.mail),
                        labelText: "Email",
                        hintText: "Enter your email",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => controller.setEmail(value),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      obscureText: controller.obscureText.value,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        labelText: "Password",
                        hintText: "***********",
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.toggleObscureText();
                          },
                          icon: Icon(controller.obscureText.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                      onChanged: (value) => controller.setPassword(value),
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
                            value: controller.checkBox.value,
                            onChanged: (value) {
                              controller.toggleCheckBox();
                            },
                          ),
                          const Text(
                            'Remember Me',
                            style: TextStyle(
                              color: Colors.white,
                            ),
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
                            controller.handleLogin();
                          },
                          child: const Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
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
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
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
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
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
