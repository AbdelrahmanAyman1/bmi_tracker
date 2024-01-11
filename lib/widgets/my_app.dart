import 'package:bmi_tracker/screens/home_screen.dart';
import 'package:bmi_tracker/screens/sing_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: FirebaseAuth.instance.currentUser == null
              ? SingInScreen.routeName
              : HomeScreen.routeName,
          routes: {
            SingInScreen.routeName: (context) => const SingInScreen(),
            HomeScreen.routeName: (context) => const HomeScreen()
          },
        );
      },
    );
  }
}