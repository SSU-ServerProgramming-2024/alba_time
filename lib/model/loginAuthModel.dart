class LoginAuthModel {
  final int userId;
  final int bossNo;

  LoginAuthModel({
    required this.userId,
    required this.bossNo,
  });

  factory LoginAuthModel.fromJson(Map<String, dynamic> json) {
    return LoginAuthModel(
      userId: json["user_id"],
      bossNo: json["boss_no"],
    );
  }
}
