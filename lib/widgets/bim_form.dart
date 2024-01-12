import 'package:bmi_tracker/model/result_model.dart';
import 'package:bmi_tracker/providers/bmi_calc_provider.dart';
import 'package:bmi_tracker/screens/result_screen.dart';
import 'package:bmi_tracker/widgets/custom_button.dart';
import 'package:bmi_tracker/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BIMForm extends StatelessWidget {
  const BIMForm({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BmiCalcProvider>(context);
    return Form(
      key: provider.formKey,
      autovalidateMode: provider.autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                  child: CustomTextField(
                hint: 'Weight',
                controller: provider.weightController,
                errorMessage: 'enter your weight',
              )),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                  child: CustomTextField(
                    hint: 'Height',
                controller: provider.heightController,
                errorMessage: 'enter your height',
              )),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          CustomTextField(
            hint: 'Age',
            controller: provider.ageController,
            errorMessage: 'enter your age',
          ),
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomButton(
                onPressed: () {
                  provider.addBMIToFireStore();
                  Navigator.pushNamed(context, ResultScreen.routeName,
                      arguments: provider.resultModel);
                  provider.ageController.text = '';
                  provider.heightController.text = '';
                  provider.weightController.text = '';
                  provider.resultModel = null;
                },
                text: 'Calculate'),
          )
        ],
      ),
    );
  }
}
