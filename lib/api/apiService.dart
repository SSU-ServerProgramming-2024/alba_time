import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:alba_time/model/loginAuthModel.dart';

class Response {
  int statusCode;
  dynamic result;
  Response(this.statusCode, this.result);
}

class ApiService {
  final String baseUrl = "http://10.27.0.83:5000";
  Client client = Client();

  Future<Response?> loginAuth(String id, String password) async {
    final uri = Uri.parse("$baseUrl/login");
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Response(response.statusCode, LoginAuthModel.fromJson(data));
    } else {
      return Response(response.statusCode, null);
    }
  }
/*
  Future<bool> createProfile(Profile data) async {
    final response = await client.post(
      "$baseUrl/api/profile",
      headers: {"content-type": "application/json"},
      body: profileToJson(data),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateProfile(Profile data) async {
    final response = await client.put(
      "$baseUrl/api/profile/${data.id}",
      headers: {"content-type": "application/json"},
      body: profileToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteProfile(int id) async {
    final response = await client.delete(
      "$baseUrl/api/profile/$id",
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
*/
}