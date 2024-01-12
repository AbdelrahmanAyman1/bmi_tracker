import 'dart:math';

import 'package:bmi_tracker/model/result_model.dart';
import 'package:bmi_tracker/services/fire_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BmiCalcProvider extends ChangeNotifier {
  TextEditingController weightController = TextEditingController();

  TextEditingController heightController = TextEditingController();

  TextEditingController ageController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey();
  double? weight;
  double? height;
  int? age;
  String? status;
  double? result;
  ResultModel? resultModel;

  void addBMIToFireStore() {
    if (formKey.currentState!.validate() || resultModel == null) {
      formKey.currentState!.save();
      calcBMI();
      resultModel = ResultModel(
          result: result!,
          emailId: FirebaseAuth.instance.currentUser!.uid,
          weight: double.parse(weightController.text),
          height: double.parse(heightController.text),
          date: DateTime.now(),
          age: int.parse(ageController.text),
          status: status!);
      FireStoreFunctions.addResult(resultModel!);
      notifyListeners();
    } else {
      autovalidateMode = AutovalidateMode.always;
      notifyListeners();
    }
  }

  double calcBMI() {
    weight = double.parse(weightController.text);
    height = double.parse(heightController.text);
    result = weight! / pow(height! / 100, 2);

    status = (result! >= 16 && result! < 18.5)
        ? 'underweight'
        : (result! >= 18.5 && result! < 25)
            ? 'normal'
            : (result! >= 25 && result! < 30)
                ? 'overweight'
                : 'obesity';

    return result!;
  }
}
