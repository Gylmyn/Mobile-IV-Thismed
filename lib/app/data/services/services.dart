// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:thismed_app/app/data/model/models.dart';
import 'package:http/http.dart' as http;

final String? baseUrl = dotenv.env['BASE_URL'];
final String? getData = dotenv.env['GET_DATA'];
final String? registerUrl = dotenv.env['REGISTER'];
final String? loginUrl = dotenv.env['LOGIN'];

class ApiCall {
  static Future<List<Users>> fetchData() async {
    final response = await http.get(Uri.parse('$baseUrl$getData'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      return List<Users>.from(data.map((user) => Users.fromJson(user)));
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<void> register(
      String username, String email, String password) async {
    final userData = {
      'username': username,
      'email': email,
      'password': password,
    };
    final response = await http.post(
      Uri.parse('$baseUrl$registerUrl'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userData),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print('Message: ${responseData['message']}');
    } else {
      print('Failed to create account. Error: ${response.reasonPhrase}');
    }
  }

  static Future<void> login(String email, String password) async {
    final userData = {
      'email': email,
      'password': password,
    };
    final response = await http.post(
      Uri.parse('$baseUrl$loginUrl'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userData),
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print(responseData);
      return responseData;
    } else {
      print('Failed to create account. Error: ${response.reasonPhrase}');
    }
  }
}
