import 'package:bmi_tracker/widgets/custom_button.dart';
import 'package:bmi_tracker/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BIMForm extends StatefulWidget {
  const BIMForm({super.key});

  @override
  State<BIMForm> createState() => _BIMFormState();
}

class _BIMFormState extends State<BIMForm> {
  TextEditingController weightController = TextEditingController();

  TextEditingController heightController = TextEditingController();

  TextEditingController ageController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                  child: CustomTextField(
                hint: 'Weight',
                controller: weightController,
                errorMessage: 'enter your weight',
              )),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                  child: CustomTextField(
                hint: 'Height',
                controller: heightController,
                errorMessage: 'enter your height',
              )),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          CustomTextField(
            hint: 'Age',
            controller: ageController,
            errorMessage: 'enter your age',
          ),
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: 'Calculate'),
          )
        ],
      ),
    );
  }
}
