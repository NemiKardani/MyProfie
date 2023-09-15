import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_profile/model/user_responce.dart';
import 'package:my_profile/routes/routes.dart';
import 'package:my_profile/theme/color/colors.dart';
import 'package:my_profile/utills/session/sessionhelper.dart';
import 'package:my_profile/view/authantication/login/login_controller.dart';
import 'package:my_profile/view/components/my_form_field.dart';
import 'package:my_profile/view/components/my_regular_text.dart';
import 'package:my_profile/view/components/my_theme_button.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(16.0).copyWith(bottom: 0),
        child: Form(
          key: controller.formKey,
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
                height: context.height * 0.01,
              ),
              const MyRegularText(
                label: "Login",
                color: primaryTextColor,
                fontSize: 18,
              ),
              SizedBox(
                height: context.height * 0.04,
              ),
              MyFormField(
                  controller: controller.emailTextEditingController,
                  prefixIconUnderLine: const Icon(
                    Icons.email_outlined,
                    color: textFieldBorderColor,
                  ),
                  isShowDefaultValidator: true,
                  isRequire: true,
                  labelText: "Email"),
              SizedBox(
                height: context.height * 0.02,
              ),
              Obx(() {
                return MyFormField(
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Please Insert Password";
                      }
                      return null;
                    },
                    isRequire: true,
                    alignLabelWithHint: true,
                    textInputType: TextInputType.visiblePassword,
                    obscureText: controller.isPasswordVisable.value,
                    maxLines: 1,
                    prefixIconUnderLine: const Icon(
                      Icons.password_outlined,
                      color: textFieldBorderColor,
                    ),
                    controller: controller.passwordTextEditingController,
                    suffixIcon: controller.passwordShowHideWidget(),
                    labelText: "Password");
              }),
              SizedBox(
                height: context.height * 0.016,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const MyRegularText(
                    label: "Remember Me",
                  ),
                  Obx(() {
                    return Checkbox.adaptive(
                      value: controller.isRememberMe.value,
                      onChanged: (value) {
                        controller.checkRememberMe();
                      },
                    );
                  })
                ],
              ),
              SizedBox(
                height: context.height * 0.08,
              ),
              MyThemeButton(
                buttonText: "Login",
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {}
                },
              ),
              SizedBox(
                height: context.height * 0.03,
              ),
              SignInButton(
                Buttons.Google,
                elevation: 0,
                onPressed: () {
                  signInwithGoogle();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  User? _user;

  void signInwithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleSignInAuthentication =
        await googleSignInAccount?.authentication;
    if (googleSignInAuthentication != null) {
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential).then((value) {
        SessionHelper().setLoginData(
            UserResponse(email: value.user!.email, password: value.user!.uid));

        Get.offNamed(AppRoutes.homeScreen);
      });
      _user = _auth.currentUser!;
    }
  }
}
