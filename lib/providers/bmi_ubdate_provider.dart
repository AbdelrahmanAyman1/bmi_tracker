import 'dart:math';

import 'package:bmi_tracker/model/result_model.dart';
import 'package:bmi_tracker/services/fire_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BmiUpdateProvider extends ChangeNotifier {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey();
  ResultModel? resultModel;
  double? result;
  String? status;

  void updateBMIInFireStore() {
    if (formKey.currentState!.validate() || resultModel == null) {
      formKey.currentState!.save();

      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text);

      // Calculate BMI and status
      result = calcBMI(weight, height);
      status = getStatus(result!);

      // Update resultModel with new values
      resultModel = ResultModel(
        result: result!,
        emailId: FirebaseAuth.instance.currentUser!.uid,
        weight: weight,
        height: height,
        date: DateTime.now(),
        age: int.parse(ageController.text),
        status: status!,
      );

      FireStoreFunctions.updateTask(resultModel!);

      notifyListeners();
    } else {
      autovalidateMode = AutovalidateMode.always;
      notifyListeners();
    }
  }

  double calcBMI(double weight, double height) {
    return weight / pow(height / 100, 2);
  }

  String getStatus(double result) {
    return (result >= 16 && result < 18.5)
        ? 'underweight'
        : (result >= 18.5 && result < 25)
            ? 'normal'
            : (result >= 25 && result < 30)
                ? 'overweight'
                : 'obesity';
  }
}
