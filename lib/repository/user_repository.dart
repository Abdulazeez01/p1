import 'dart:async';

import 'package:front_end/api_services/api_handler.dart';
import 'package:front_end/models/user_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final ApiHandler apiHandler;

  UserRepository({required this.apiHandler});

  Future<User> authenticate(
      {required String username, required String password}) async {
    final response = await apiHandler.post('/login', {
      'username': username,
      'password': password
    }, headers: {
      'Content-Type': 'application/json',
    });
    print(response);
    await _saveToken(response['token']);
    final User user = User.fromJson(response['user']);

    return user;
  }

  Future<void> deleteToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  Future<bool> hasToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') != null;
  }

  Future<User> getUser() async {
    final response = await apiHandler.get(
      '/user',
    );
    final User user = User.fromJson(response['user']);
    await _saveToken(response['token']);
    return user;
  }

  Future<void> _saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }
}
