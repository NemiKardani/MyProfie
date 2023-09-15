import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/routes/routes.dart';
import 'package:my_profile/theme/get_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  NkGetXTheme.systemChromeStyle;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: NkGetXTheme.lightTheme,
      darkTheme: NkGetXTheme.lightTheme,
      getPages: AppRoutes.genratedRoutes,
      initialRoute: AppRoutes.initialRoutes,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}
