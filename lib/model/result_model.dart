import 'package:cloud_firestore/cloud_firestore.dart';

class ResultModel {
  String id;
  String emailId;
  double weight;
  double height;
  int age;
  double result;
  String status;
  DateTime date;

  ResultModel(
      {this.id = '',
      required this.emailId,
      required this.weight,
      required this.height,
      required this.age,
      required this.result,
      required this.status,
      required this.date});

  ResultModel.fromJson(Map<String, dynamic> json)
      : this(
    status: json['status'],
          weight: json['weight'],
          height: json['height'],
          date: (json['date'] as Timestamp).toDate(),
          age: json['age'],
          result: json['result'],
          emailId: json['emailId'],
          id: json['id'],
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      'status': status,
      "date": date,
      "weight": weight,
      "height": height,
      "age": age,
      "emailId": emailId,
      "result": result
    };
  }
}
