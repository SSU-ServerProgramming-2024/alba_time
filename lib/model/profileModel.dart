class ProfileModel {
  final String name;
  final int compno;
  final String com_name;
  final String com_loc;
  final int type;
  final int age;

  ProfileModel({
    required this.name,
    required this.compno,
    required this.com_name,
    required this.com_loc,
    required this.type,
    required this.age
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json["name"],
      compno: json["compno"],
      com_name: json["com_name"],
      com_loc: json["com_loc"],
      type: json["type"],
      age: json["age"]
    );
  }
}
