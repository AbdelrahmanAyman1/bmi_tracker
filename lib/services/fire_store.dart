import 'package:bmi_tracker/model/result_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreFunctions {
  static Future<void> addResult(ResultModel resultModel) async {
    await FirebaseFirestore.instance
        .collection('Result')
        .add(resultModel.toJson());
  }
}
