import 'dart:convert';
import 'package:alba_time/model/employeeInfoModel.dart';
import 'package:http/http.dart' as http;
import 'package:alba_time/model/loginAuthModel.dart';

import 'package:alba_time/model/profileModel.dart';

class Response {
  int statusCode;
  dynamic result;
  Response(this.statusCode, this.result);
}

class ApiService {
  final String baseUrl = "http://10.27.0.4:5000";

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

  Future<Response?> getProfile(int id) async {
    final userId = id.toString();
    final url = Uri.parse("$baseUrl/auth/profile?user_id=$userId");

    final response = await http.get(
        url,
        headers: {"Content-Type": "application/json"}
    ).timeout(
        const Duration(seconds: 5)
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Response(response.statusCode, ProfileModel.fromJson(data));
    } else {
      return Response(response.statusCode, null);
    }
  }

  Future<Response?> getWorkerList(int bossno) async {
    final bossnostr = bossno.toString();
    final url = Uri.parse("$baseUrl/info/profile?bossno=$bossnostr");

    final response = await http.get(
        url,
        headers: {"Content-Type": "application/json"}
    ).timeout(
        const Duration(seconds: 5)
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Response(response.statusCode, EmployeeInfoModel.fromJsonList(data['worker_list']));
    } else {
      return Response(response.statusCode, null);
    }
  }
}