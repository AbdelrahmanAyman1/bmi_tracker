import 'package:bmi_tracker/screens/sing_in_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SingInScreen.routeName,
      routes: {
        SingInScreen.routeName: (context) => const SingInScreen(),
      },
    );
  }
}
