import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../repo/singn_up_repo.dart';

class SingUpController extends GetxController {
  var nameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var confirmPassController = TextEditingController().obs;

  signUp() async {
    var response = await SignUpRepo().signUp(nameController.value.text, emailController.value.text, passwordController.value.text, confirmPassController.value.text);

    if (response.status == true) {
      Get.toNamed(AppRoutes.loginScreen);

      nameController.value.clear();
      emailController.value.clear();
      passwordController.value.clear();
      confirmPassController.value.clear();
      Get.snackbar("Success", "SignUp successfull");
    } else {
      Get.snackbar("Error", "Singup Unsuccessfull");
    }
  }
}
