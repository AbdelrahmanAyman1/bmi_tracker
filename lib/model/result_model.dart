import 'package:firebase_auth/firebase_auth.dart';

class ResultModel {
  FirebaseAuth id;
  double weight;
  double height;
  int age;
  int date;

  ResultModel(
      {required this.id,
      required this.weight,
      required this.height,
      required this.date,
      required this.age});

  ResultModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          date: json['date'],
          weight: json['weight'],
          height: json['height'],
          age: json['age'],
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id.currentUser?.uid,
      "date": date,
      "weight": weight,
      "height": height,
      "age": age,
    };
  }
}
