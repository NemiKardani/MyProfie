import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/theme/color/colors.dart';
import 'package:my_profile/view/authantication/login/login_controller.dart';
import 'package:my_profile/view/components/my_form_field.dart';
import 'package:my_profile/view/components/my_regular_text.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(16.0).copyWith(bottom: 0),
        child: ListView(
          children: [
            Image.network(
              "https://38.media.tumblr.com/38f1fc463917467ed2c64170f8a671fc/tumblr_nj5gw1AsF81qkmh37o1_500.gif",
              height: context.height * 0.3,
            ),
            const MyRegularText(
              label: "My Profile",
              color: secondaryTextColor,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
            const MyRegularText(
              label: "Login",
              color: primaryTextColor,
              fontSize: 18,
            ),
            SizedBox(
              height: context.height * 0.08,
            ),
            MyFormField(
                controller: controller.emailTextEditingController,
                prefixIconUnderLine: const Icon(
                  Icons.email_outlined,
                  color: textFieldBorderColor,
                ),
                labelText: "Email"),
            SizedBox(
              height: context.height * 0.03,
            ),
            Obx(() {
              return MyFormField(
                  alignLabelWithHint: true,
                  textInputType: TextInputType.visiblePassword,
                  obscureText: controller.isPasswordVisable.value,
                  maxLines: 1,
                  prefixIconUnderLine: const Icon(
                    Icons.password_outlined,
                    color: textFieldBorderColor,
                  ),
                  controller: controller.emailTextEditingController,
                  suffixIcon: controller.passwordShowHideWidget(),
                  labelText: "Password");
            })
          ],
        ),
      ),
    );
  }
}
