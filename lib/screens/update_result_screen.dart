import 'package:bmi_tracker/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateResult extends StatelessWidget {
  static String routeName = 'update';

  const UpdateResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          title: Text(
            'Update',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          )),
    );
  }
}
