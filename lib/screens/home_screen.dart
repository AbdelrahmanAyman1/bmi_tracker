import 'package:bmi_tracker/constant/color.dart';
import 'package:bmi_tracker/screens/tabs/home_tab.dart';
import 'package:bmi_tracker/screens/tabs/result_tab.dart';
import 'package:bmi_tracker/screens/tabs/sing_out_tab.dart';
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
  List<Widget> tabs = const [HomeTab(), ResultTab(), SingOutTab()];

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
      body: tabs[index],
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
