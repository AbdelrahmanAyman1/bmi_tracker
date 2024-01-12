import 'package:bmi_tracker/constant/color.dart';
import 'package:bmi_tracker/model/result_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultScreen extends StatelessWidget {
  static String routeName = 'result';

  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as ResultModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          'Result',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Result',
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
            ),
            Text('Age= ${args.age}', style: TextStyle(fontSize: 18.sp)),
            Text('weight= ${args.weight} KG',
                style: TextStyle(fontSize: 18.sp)),
            Text('height= ${args.height} CM',
                style: TextStyle(fontSize: 18.sp)),
            Text('status= ${args.status}', style: TextStyle(fontSize: 18.sp)),
            Text('result= ${args.result}'.substring(0, 12),
                style: TextStyle(fontSize: 18.sp)),
          ],
        ),
      ),
    );
  }
}
