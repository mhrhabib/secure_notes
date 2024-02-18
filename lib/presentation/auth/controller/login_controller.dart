import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../routes/app_routes.dart';
import '../repo/login_repo.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    user.bindStream(_auth.authStateChanges());
    print('>>>>>>>user $user');
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (error) {
      print("Error during sign in: $error");
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;

  var isVisible = true.obs;

  void visibilityToggle() {
    isVisible.value = !isVisible.value;
    update();
  }

  loginWithEmail() async {
    var response = await LoginRepo().login(emailController.value.text, passwordController.value.text);

    if (response.status == true) {
      final box = GetStorage();
      box.write('token', response.token);
      Get.toNamed(AppRoutes.mainPageScreen);

      emailController.value.clear();
      passwordController.value.clear();
      Get.snackbar("Success", "Login successfull");
    } else {
      Get.snackbar("Error", "Login Unsuccessfull");
    }
  }
}
