import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bmi_tracker/helper/show_dialog.dart';
import 'package:bmi_tracker/screens/sing_in_screen.dart';
import 'package:bmi_tracker/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingOutTab extends StatelessWidget {
  const SingOutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 50.h),
        Image.asset('assets/images/logout.png',
            width: double.infinity.w, height: 300.h),
        SizedBox(height: 50.h),
        Text(
          textAlign: TextAlign.center,
          'You want to sing out',
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomButton(
            onPressed: () {
              awesomeDialog('warning', 'Are you sure you want to sing out',
                  context, DialogType.warning,
                  dismissOnTouchOutside: false,
                  btnCancelOnPress: () {}, btnOkOnPress: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, SingInScreen.routeName);
              });
            },
            text: 'Sing in',
          ),
        )
      ],
    );
  }
}
