import 'package:bmi_tracker/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      required this.controller,
      required this.errorMessage});

  final String hint;
  final String? errorMessage;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => value?.trim().isEmpty == true ? errorMessage : null,
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding:
            EdgeInsetsDirectional.symmetric(vertical: 13.h, horizontal: 10.w),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.w)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(50.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(50.w),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(50.w),
        ),
      ),
    );
  }
}
