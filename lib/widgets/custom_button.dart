import 'package:bmi_tracker/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            padding: EdgeInsetsDirectional.symmetric(vertical: 10.h)),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ));
  }
}
