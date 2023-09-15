import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/theme/color/colors.dart';

class LoginController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  RxBool isPasswordVisable = false.obs;
  RxBool isRememberMe = false.obs;

  checkRememberMe() {
    isRememberMe.value = !isRememberMe.value;
    refresh();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget passwordShowHideWidget() {
    if (isPasswordVisable.isTrue) {
      return IconButton(
          onPressed: () {
            isPasswordVisable.value = false;
            refresh();
          },
          icon: const Icon(
            Icons.remove_red_eye_outlined,
            color: textFieldBorderColor,
          ));
    } else {
      return IconButton(
          onPressed: () {
            isPasswordVisable.value = true;
            refresh();
          },
          icon: const Icon(
            Icons.visibility_off_outlined,
            color: textFieldBorderColor,
          ));
    }
  }
}
