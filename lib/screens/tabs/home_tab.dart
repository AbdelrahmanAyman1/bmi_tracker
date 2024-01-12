import 'package:bmi_tracker/providers/bmi_calc_provider.dart';
import 'package:bmi_tracker/widgets/bim_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BmiCalcProvider>(context);
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
      child: const BIMForm(),
    );
  }
}
