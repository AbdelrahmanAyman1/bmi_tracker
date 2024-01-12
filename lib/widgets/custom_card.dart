import 'package:bmi_tracker/constant/color.dart';
import 'package:bmi_tracker/model/result_model.dart';
import 'package:bmi_tracker/services/fire_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  final ResultModel result;

  const CustomCard({required this.result, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryColor,
      elevation: 10,
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        height: 170.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'BMI= ${result.result}'.substring(0, 9),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      FireStoreFunctions.deleteTask(result.id);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ))
              ],
            ),
            Text(
              'age= ${result.age}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'weight= ${result.weight} KG',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'height= ${result.height} CM',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              textAlign: TextAlign.center,
              'status= ${result.status}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              textAlign: TextAlign.right,
              ' ${result.date}'.substring(0, 11),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
