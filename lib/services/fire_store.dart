import 'package:bmi_tracker/model/result_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireStoreFunctions {
  static Future<void> addResult(ResultModel resultModel) async {
    var collection = getResultCollection();
    var docRef = collection.doc();
    resultModel.id = docRef.id;
    return docRef.set(resultModel);
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
        .where('emailId', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .snapshots();
  }

  static void deleteTask(String id) {
    getResultCollection().doc(id).delete();
  }
}
