import 'package:bmi_tracker/constant/color.dart';
import 'package:bmi_tracker/widgets/custom_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Tracker',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        index: index,
        onTabChange: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
