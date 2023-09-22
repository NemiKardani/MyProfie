import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion/motion.dart';
import 'package:my_profile/routes/routes.dart';
import 'package:my_profile/theme/get_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Motion.instance.initialize();

  Motion.instance.setUpdateInterval(120.fps);

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBNMBDsrwL_ydzZ6fUYSCWmTLOuaRAS1zA",
            authDomain: "profileapp-a0e2b.firebaseapp.com",
            projectId: "profileapp-a0e2b",
            storageBucket: "profileapp-a0e2b.appspot.com",
            messagingSenderId: "230256510751",
            appId: "1:230256510751:web:b18eda5d2aca3e1693d22a",
            measurementId: "G-T3WPVWY4HH"));
  } else {
    Firebase.initializeApp();
  }
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
