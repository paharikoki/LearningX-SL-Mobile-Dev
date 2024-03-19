import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:obx_test/screens/fortest/bottomsheets.dart';
import 'package:obx_test/screens/fortest/dialog.dart';
import 'package:obx_test/screens/fortest/snack_bar.dart';
import 'package:obx_test/screens/home_screen.dart';
import 'package:obx_test/screens/login_screen.dart';
import 'package:obx_test/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const LoginScreen(),
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/register', page: () => const RegisterScreen()),
        GetPage(name: '/snack', page: () => const SnackBarPage()),
        GetPage(name: '/dialog', page: () => const DialogPage()),
        GetPage(name: '/bottom', page: () => const BottomSheetsPage()),
      ],
      theme: _buildTheme(Brightness.dark),
    );
  }
}

ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(brightness: brightness);
  return baseTheme.copyWith(
    primaryColor: Colors.blue,
    hintColor: Colors.white,
    scaffoldBackgroundColor: const Color(0x26262600),
    textTheme: GoogleFonts.inclusiveSansTextTheme().apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      hintStyle: TextStyle(color: Colors.white),
      labelStyle: TextStyle(color: Colors.white),
      floatingLabelAlignment: FloatingLabelAlignment.start,
      alignLabelWithHint: true,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      contentPadding: EdgeInsets.symmetric(vertical: 18),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateColor.resolveWith((states) => Colors.white),
      overlayColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.hovered)) {
          return Colors.blue.withOpacity(0.04);
        }
        return Colors.transparent;
      }),
      fillColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.blue;
        }
        return Colors.transparent;
      }),
    ),
  );
}
