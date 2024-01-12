import 'package:bmi_tracker/screens/home_screen.dart';
import 'package:bmi_tracker/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingInScreen extends StatelessWidget {
  static String routeName = 'singIn';

  const SingInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 50.h),
          Image.asset('assets/images/login.gif',
              width: double.infinity.w, height: 300.h),
          SizedBox(height: 50.h),
          Text(
            textAlign: TextAlign.center,
            'Please Sing In',
            style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomButton(
              onPressed: () async {
                final userCredential =
                    await FirebaseAuth.instance.signInAnonymously();
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              },
              text: 'Sing in',
            ),
          )
        ],
      ),
    );
  }
}

