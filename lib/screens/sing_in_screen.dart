import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingInScreen extends StatelessWidget {
  static String routeName = 'singIn';

  const SingInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/images/login.gif',
              width: double.infinity.w, height: 300.h)
        ],
      ),
    );
  }
}
