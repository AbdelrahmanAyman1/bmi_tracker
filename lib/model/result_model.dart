class ResultModel {
  String? id;
  double weight;
  double height;
  int age;
  double result;
  String status;
  DateTime date;

  ResultModel(
      {required this.status,
      required this.weight,
      required this.height,
      required this.date,
      required this.age,
      required this.result,
      required this.id});

  ResultModel.fromJson(Map<String, dynamic> json)
      : this(
          status: json['status'],
          weight: json['weight'],
          height: json['height'],
          date: json['date'],
          age: json['age'],
          result: json['result'],
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
      "result": result
    };
  }
}
