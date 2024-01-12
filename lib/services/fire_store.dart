import 'package:bmi_tracker/model/result_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireStoreFunctions {
  static Future<void> addResult(ResultModel resultModel) async {
    await FirebaseFirestore.instance
        .collection('Result')
        .add(resultModel.toJson());
  }

  static CollectionReference<ResultModel> getResultCollection() {
    return FirebaseFirestore.instance
        .collection('Result')
        .withConverter<ResultModel>(fromFirestore: (snapshot, _) {
      return ResultModel.fromJson(snapshot.data()!);
    }, toFirestore: (value, _) {
      return value.toJson();
    });
  }

  static Stream<QuerySnapshot<ResultModel>> getResult() {
    return getResultCollection()
        .orderBy('date', descending: true)
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .snapshots();
  }

  static void deleteTask(String id) {
    getResultCollection().doc(id).delete();
  }
}
