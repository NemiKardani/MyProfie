import 'package:get/get.dart';
import 'package:my_profile/routes/routes.dart';
import 'package:my_profile/utills/session/sessionhelper.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    _startTimer();
    super.onInit();
  }

  void _startTimer() => Future.delayed(
        const Duration(seconds: 6),
        () {
          SessionHelper().getLoginData().then((value) {
            if (value != null) {
              SessionHelper.loginSavedData = value;
              Get.offNamedUntil(AppRoutes.homeScreen, (route) => false);
            } else {
              Get.offNamedUntil(AppRoutes.loginScreen, (route) => false);
            }
          });
        },
      );
}
