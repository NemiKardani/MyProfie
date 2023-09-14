import 'package:get/get.dart';
import 'package:my_profile/utills/genral_binding.dart';
import 'package:my_profile/view/authantication/login/login_screen.dart';
import 'package:my_profile/view/splash/splash_screen.dart';

class AppRoutes {
  static const String initialRoutes = "/";
  static const String loginScreen = "/login";

  static List<GetPage<dynamic>> get genratedRoutes => [
        GetPage(
            name: initialRoutes,
            page: () => SplashScreen(),
            binding: GenralBinding()),
        GetPage(
            name: loginScreen,
            page: () => LoginScreen(),
            binding: GenralBinding()),
      ];
}
