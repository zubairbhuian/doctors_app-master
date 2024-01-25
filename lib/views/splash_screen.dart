import 'dart:async';

import 'package:doctors_app/services/user_service.dart';
import 'package:doctors_app/views/auth_screen.dart';
import 'package:doctors_app/views/dashboard_screen.dart';
import 'package:doctors_app/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserService userService = UserService();

  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () => userCheck(),
    );
    super.initState();
  }

  userCheck() async {
    var isUser = await userService.getBool();
    if (isUser == true) {
      Get.off(() => const DashBoardScreen());
    } else {
      Get.off(() => const WelcomescreenCheck());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(),
      ),
    );
  }
}
