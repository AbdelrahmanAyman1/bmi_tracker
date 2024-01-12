import 'package:bmi_tracker/model/result_model.dart';
import 'package:bmi_tracker/providers/bmi_calc_provider.dart';
import 'package:bmi_tracker/providers/bmi_ubdate_provider.dart';
import 'package:bmi_tracker/screens/result_screen.dart';
import 'package:bmi_tracker/widgets/custom_button.dart';
import 'package:bmi_tracker/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BMIUpdateForm extends StatelessWidget {
  const BMIUpdateForm({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BmiUpdateProvider>(context);

    var args = ModalRoute.of(context)!.settings.arguments as ResultModel;
    final userColl = FirebaseFirestore.instance.collection('Result');
    return StreamBuilder<DocumentSnapshot>(
        stream: userColl.doc(args.id).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>?;
            String newValue = '';
            var height = provider.heightController.text =
                userData?['height'].toString() ?? '';
            var age =
                provider.ageController.text = userData?['age'].toString() ?? '';
            var weight = provider.weightController.text =
                userData?['weight'].toString() ?? '';
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
                        onSaved: (value) {
                          newValue = value!;
                          userColl
                              .doc(args.id)
                              .update({'weight': double.parse(newValue)});
                        },
                      )),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                          child: CustomTextField(
                        hint: 'Height',
                        controller: provider.heightController,
                        errorMessage: 'enter your height',
                        onSaved: (value) {
                          newValue = value!;
                          userColl
                              .doc(args.id)
                              .update({'height': double.parse(newValue)});
                        },
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
                    onSaved: (value) {
                      newValue = value!;
                      userColl
                          .doc(args.id)
                          .update({'age': int.parse(newValue)});
                    },
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CustomButton(
                      onPressed: () {
                        provider.updateBMIInFireStore();

                        userColl.doc(args.id).update({
                          'weight':
                              double.parse(provider.weightController.text),
                          'height':
                              double.parse(provider.heightController.text),
                          'age': int.parse(provider.ageController.text),
                          'result': provider.result ?? 0.0,
                          'status': provider.status ?? '',
                          'date': DateTime.now(),
                        });

                        Navigator.pop(context);
                      },
                      text: 'Calculate',
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Text('SomeTing went wrong');
          }
        });
  }
}
