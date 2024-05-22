class EmployeeInfoModel {
  final String name;
  final int albano;
  final int age;
  final int absent;
  final int late;
  final String review_content;
  final int salary;
  final String start_day;

  EmployeeInfoModel({
    required this.name,
    required this.albano,
    required this.age,
    required this.absent,
    required this.late,
    required this.review_content,
    required this.salary,
    required this.start_day
  });

  factory EmployeeInfoModel.fromJson(Map<String, dynamic> json) {
    return EmployeeInfoModel(
      name: json["name"],
      albano: json["albano"],
      age: json["age"],
      absent: json["absent"],
      late: json["late"],
      review_content: json["review_content"],
      salary: json["salary"],
      start_day: json["start_day"],
    );
  }

  static List<EmployeeInfoModel> fromJsonList(Map<String, dynamic> json) {
    final Iterable jsonArray = json["worker_list"];
    return jsonArray.map((jsonItem) => EmployeeInfoModel.fromJson(jsonItem)).toList();
  }
}
