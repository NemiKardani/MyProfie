import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion/motion.dart';
import 'package:my_profile/routes/routes.dart';
import 'package:my_profile/theme/color/colors.dart';
import 'package:my_profile/utills/session/sessionhelper.dart';
import 'package:my_profile/utills/session/sessionmanager.dart';
import 'package:my_profile/view/components/my_regular_text.dart';
import 'package:my_profile/view/components/my_theme_button.dart';
import 'package:my_profile/view/permission/gyroschope_permission.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (Motion.instance.isPermissionRequired &&
        !Motion.instance.isPermissionGranted) {
      showPermissionRequestDialog(
        context,
        onDone: () {
          setState(() {});
        },
      );
    }
    return Scaffold(
        body: SafeArea(
      minimum: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(child: mainWidget(context)),
    ));
  }

  Widget mainWidget(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.topRight,
            child: IconButton.filledTonal(
                onPressed: () {
                  SessionManager.clearData();
                  FirebaseAuth.instance.signOut();

                  Get.offNamedUntil(
                    AppRoutes.loginScreen,
                    (route) => false,
                  );
                },
                icon: Icon(Icons.logout))),
        //SizedBox(height: 100, width: 100, child: DemoPage()),
        //MyWidget(child: Placeholder()),
        SizedBox(
          height: context.height * 0.04,
        ),
        profileImageWidget(context),
        SizedBox(
          height: context.height * 0.04,
        ),
        Motion.only(
          //elevation: 90,
          borderRadius: BorderRadius.circular(10),
          child: Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: basicDetails(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget basicDetails(BuildContext context) {
    return Column(
      children: [
        detailComponent("User Name",
            SessionHelper.loginSavedData!.userName.toString(), context),
        SizedBox(
          height: context.height * 0.02,
        ),
        detailComponent(
            "Email", SessionHelper.loginSavedData!.email.toString(), context),
        SizedBox(
          height: context.height * 0.02,
        ),
        detailComponent("Address",
            SessionHelper.loginSavedData!.location.toString(), context),
        SizedBox(
          height: context.height * 0.02,
        ),
        detailComponent("Work Experience",
            SessionHelper.loginSavedData!.workExpirience.toString(), context),
        SizedBox(
          height: context.height * 0.02,
        ),
        skillsWidget(context),
        SizedBox(
          height: context.height * 0.06,
        ),
        MyThemeButton(
            buttonText: "Edit Details",
            onPressed: () {
              Get.toNamed(AppRoutes.editDetails)?.whenComplete(() {
                setState(() {
                  SessionHelper.loginSavedData;
                });
              });
            }),
      ],
    );
  }

  Widget skillsWidget(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyRegularText(
          label: "Skills: ",
          fontSize: 16,
          color: primaryTextColor,
        ),
        Flexible(
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: List<Widget>.generate(
                SessionHelper.loginSavedData!.skills!.length,
                (index) => Card(
                      elevation: 3,
                      margin: index == 0 ? EdgeInsets.zero : null,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyRegularText(
                            label: SessionHelper.loginSavedData!.skills![index],
                            fontSize: 14,
                            color: primaryTextColor),
                      ),
                    )),
          ),
        )
      ],
    );
  }

  Widget detailComponent(
      String lableName, String mainName, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MyRegularText(
          label: "${lableName}: ",
          fontSize: 16,
          color: primaryTextColor,
        ),
        SizedBox(
          width: context.width * 0.02,
        ),
        Flexible(
          child: MyRegularText(
            maxlines: mainName.length,
            align: TextAlign.start,
            label: "${mainName}",
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget profileImageWidget(BuildContext context) {
    return Center(
      child: SizedBox(
        height: context.height * 0.16,
        width: context.height * 0.17,
        // color: Colors.yellow,
        child: Motion.elevated(
          elevation: 90,
          borderRadius: BorderRadius.circular(10),
          child: Card(
            child: SizedBox(
                // color: Colors.yellow,
                height: context.height * 0.16,
                width: context.height * 0.16,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  child: Hero(
                    tag: "Img123",
                    child: GetUtils.isURL(SessionHelper
                            .loginSavedData!.userImagePath
                            .toString())
                        ? Image.network(
                            SessionHelper.loginSavedData!.userImagePath!,
                            fit: BoxFit.cover,
                          )
                        : SessionHelper.loginSavedData!.userImagePath != null &&
                                SessionHelper.loginSavedData!.userImagePath
                                    .toString()
                                    .isNotEmpty
                            ? Image.file(
                                fit: BoxFit.cover,
                                File(SessionHelper.loginSavedData!.userImagePath
                                    .toString()),
                              )
                            : Image.network(
                                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                                fit: BoxFit.cover,
                              ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
