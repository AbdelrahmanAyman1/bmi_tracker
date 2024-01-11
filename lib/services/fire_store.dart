import 'package:bmi_tracker/model/result_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreFunctions {
  static CollectionReference<ResultModel> getResultCollection() {
    return FirebaseFirestore.instance
        .collection('Result')
        .withConverter<ResultModel>(fromFirestore: (snapshot, _) {
      return ResultModel.fromJson(snapshot.data()!);
    }, toFirestore: (value, _) {
      return value.toJson();
    });
  }

  static Future<void> addTask(ResultModel taskModel) {
    var collection = getResultCollection();
    var docRef = collection.doc();
    taskModel.id = docRef.id;
    return docRef.set(taskModel);
  }
}
