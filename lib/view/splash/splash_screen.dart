import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/view/splash/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Image.network("https://i.ibb.co/v1Y4xdg/man-483.gif")),
      ),
    );
  }
}
