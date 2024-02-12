import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../../core/network/base_client.dart';
import '../../../core/utils/urls.dart';
import '../models/sign_up_model.dart';

class SignUpRepo {
  Future<SignUpModel> signUp(String name, String email, String password, String confirmPass) async {
    Map<String, dynamic> data = {
      "name": name,
      'email': email,
      'password': password,
      "password_confirmation": confirmPass,
    };

    try {
      dio.Response response = await BaseClient.post(
        url: Urls.signUp,
        payload: data,
      );
      print(data.values);

      if (response.statusCode == 200) {
        SignUpModel signUpModel = SignUpModel.fromJson(response.data);

        return signUpModel;
      } else if (response.statusCode == 401) {
        print(response.statusCode);
        Get.snackbar("Error", "Invalid Credentials");

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
