import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:alba_time/model/loginAuthModel.dart';

class Response {
  int statusCode;
  dynamic result;
  Response(this.statusCode, this.result);
}

class ApiService {
  final String baseUrl = "http://10.29.118.167:5000";

  Future<Response?> loginAuth(String id, String password) async {
    final url = Uri.parse("$baseUrl/auth/login");

    Map data = {"id": id, "password": password};
    var body = json.encode(data);
    final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body
    ).timeout(
      const Duration(seconds: 5)
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Response(response.statusCode, LoginAuthModel.fromJson(data));
    } else {
      return Response(response.statusCode, null);
    }
  }
}