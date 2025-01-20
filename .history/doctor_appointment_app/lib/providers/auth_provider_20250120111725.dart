import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  bool get isAuthenticated => _token != null;

  Future<void> register(
    String name,
    String email,
    String password,
    String passwordConfirmation,
  ) async {
    final response = await http.post(
      Uri.parse('http://yourapiurl.com/api/register'),
      body: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
      },
    );

    final responseData = json.decode(response.body);
    _token = responseData['access_token'];
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', _token!);
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://yourapiurl.com/api/login'),
      body: {'email': email, 'password': password},
    );

    final responseData = json.decode(response.body);
    _token = responseData['access_token'];
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', _token!);
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await http.post(
      Uri.parse('http://yourapiurl.com/api/logout'),
      headers: {'Authorization': 'Bearer $_token'},
    );
    _token = null;
    prefs.remove('token');
    notifyListeners();
  }
}
