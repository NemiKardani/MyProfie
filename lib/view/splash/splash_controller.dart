import 'dart:developer';

import 'package:get/get.dart';
import 'package:my_profile/routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    _startTimer();
    log("INIT PERFORMED");
    super.onInit();
  }

  void _startTimer() => Future.delayed(
        const Duration(seconds: 6),
        () {
          Get.offNamedUntil(AppRoutes.loginScreen, (route) => false);
        },
      );
}
