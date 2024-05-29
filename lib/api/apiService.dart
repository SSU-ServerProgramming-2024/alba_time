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
  final String baseUrl = "http://10.27.0.126:5000";

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
    print(bossnostr);
    final url = Uri.parse("$baseUrl/auth/workers?bossno=$bossnostr");

    final response = await http.get(
        url,
        headers: {"Content-Type": "application/json"}
    ).timeout(
        const Duration(seconds: 5)
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Response(response.statusCode, data['worker_list']);
    } else {
      return Response(response.statusCode, null);
    }
  }

  Future<Response?> createWorker(int bossno, String? name, age) async {
    final bossnostr = bossno.toString();
    final url = Uri.parse("$baseUrl/auth/create?bossno=$bossnostr");

    // Map을 동적으로 구성
    Map<String, dynamic> data = {};
    if (name != null && name.isNotEmpty) {
      data['name'] = name;
    }
    if (age != null && age.isNotEmpty) {
      data['age'] = age;
    }

    var body = json.encode(data);

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Response(response.statusCode, data);
    } else {
      return Response(response.statusCode, null);
    }
  }

  Future<Response> deleteEmployee(String employeeId) async {
    final url = Uri.parse("$baseUrl/auth/delete/$employeeId"); // 삭제할 직원의 URL 구성

    final response = await http.delete(
        url,
        headers: {"Content-Type": "application/json"}
    ).timeout(
        const Duration(seconds: 5)
    );

    if (response.statusCode == 200) {
      return Response(response.statusCode, 'Employee deleted successfully');
    } else {
      //print(response.statusCode);
      return Response(response.statusCode, json.decode(response.body)); // 에러 메시지를 포함한 응답 반환
    }
  }
}