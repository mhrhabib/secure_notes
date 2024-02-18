import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/network/base_client.dart';
import '../../../core/utils/urls.dart';
import '../../../routes/app_routes.dart';

class LogOutRepo {
  static Future logOut() async {
    try {
      dio.Response response = await BaseClient.post(url: Urls.logOut);

      if (response.statusCode == 200) {
        Get.toNamed(AppRoutes.loginScreen);
        final box = GetStorage();
        box.write('token', null);

        Get.snackbar("Success", "Logged out succesfully");
      } else {
        Get.snackbar("Error", "Logged out Unsuccessfull");
      }
    } catch (e) {}
  }
}
