import 'package:get/get.dart';
import 'package:my_profile/view/authantication/login/login_controller.dart';
import 'package:my_profile/view/edit_details/edit_details_controller.dart';
import 'package:my_profile/view/splash/splash_controller.dart';

class GenralBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => EditDetailsController());
  }
}
