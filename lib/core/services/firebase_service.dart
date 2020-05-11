import 'dart:convert';

import 'dart:io';

import 'package:flutter_fire/model/students.dart';
import 'package:flutter_fire/model/user.dart';
import 'package:flutter_fire/model/user/user_auth_error.dart';
import 'package:flutter_fire/model/user/user_request.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:flutter_fire/apiURL.dart';

class FirebaseService {
  static const String FIREBASE_URL = firebase_url;
  static const String FIREBASE_AUTH_URL = firebase_auth_url;

  Future postUser(UserRequest request) async {
    var jsonModel = json.encode(request.toJson());

    final response = await http.post(FIREBASE_AUTH_URL, body: jsonModel);

    switch (response.statusCode) {
      case HttpStatus.ok:
        return true;

      default:
        var errorJson = json.decode(response.body);
        var error = FirebaseAuthError.fromJson(errorJson);
        return error;
    }
  }

  Future<List<User>> getUsers() async {
    final response = await http.get("$FIREBASE_URL/users.json");
    List<User> userList = [];

    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonResponse = json.decode(response.body);
        jsonResponse.forEach((user) {
          final jsonList = User.fromJson(user);
          userList.add(jsonList);
        });

        return userList;
        break;
      default:
        return Future.error(response.statusCode);
    }
  }

  Future<List<Students>> getStudents() async {
    final response = await http.get("$FIREBASE_URL/students.json");
    List<Students> studentList = [];

    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonResponse = json.decode(response.body);

        jsonResponse.forEach((key, value) {
          Students student = Students.fromJson(value);
          student.key = key;
          studentList.add(student);
        });
        Logger().i(studentList);
        return studentList;
        break;
      default:
        return Future.error(response.statusCode);
    }
  }
}
