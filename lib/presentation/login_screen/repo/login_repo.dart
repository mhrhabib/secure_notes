import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dio/dio.dart' as dio;

import '../../../core/network/base_client.dart';
import '../../../core/utils/urls.dart';
import '../models/login_model.dart';

class LoginRepo {
  Future<LoginModel> login(String email, String password) async {
    Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };

    try {
      dio.Response response = await BaseClient.post(
        url: Urls.login,
        payload: data,
      );

      if (response.statusCode == 200) {
        LoginModel loginModel = LoginModel.fromJson(response.data);

        print(response.data);

        return loginModel;
      } else if (response.statusCode == 401) {
        Get.snackbar("Error", "Invalid Credentials", backgroundColor: Color(0xFFFFFFFF));

        throw Exception();
      } else {
        print(response.statusCode);
        throw Exception();
      }
    } catch (e) {
      print(e.toString());

      rethrow;
    }
  }
}
