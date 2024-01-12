import 'package:bmi_tracker/screens/home_screen.dart';
import 'package:bmi_tracker/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SingInScreen extends StatefulWidget {
  static String routeName = 'singIn';

  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Column(
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
                  setState(() {
                    isLoading = true;
                  });
                  final userCredential =
                      await FirebaseAuth.instance.signInAnonymously();
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                },
                text: 'Sing in',
              ),
            )
          ],
        ),
      ),
    );
  }
}

