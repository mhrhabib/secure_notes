import 'package:flutter/material.dart';
import 'package:secure_notes/core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import 'controller/singup_controller.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final SingUpController singUpController = Get.put(SingUpController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Text(
                  "Create your account!",
                  style: titleTextStyle.copyWith(color: Colors.black),
                ),
                SizedBox(height: 12.v),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Full Name",
                        style: labelTextStyle,
                      ),
                      SizedBox(height: 12.v),
                      TextFormField(
                        controller: singUpController.nameController.value,
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Color.fromARGB(255, 41, 25, 25)),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_2_outlined),
                          prefixIconColor: Colors.black26,
                          hintText: "Jhon Doe",
                          hintStyle: TextStyle(
                            color: Colors.black26,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          //contentPadding: EdgeInsets.only(left: 8)
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field can not be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 12.v),
                      const Text(
                        "Email Address",
                        style: labelTextStyle,
                      ),
                      SizedBox(height: 12.v),
                      TextFormField(
                        controller: singUpController.emailController.value,
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.black26),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_2_outlined),
                          prefixIconColor: Colors.black26,
                          hintText: "Example@gmail.com",
                          hintStyle: TextStyle(
                            color: Colors.black26,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          //contentPadding: EdgeInsets.only(left: 8)
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field can not be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 12.v),
                      const Text(
                        "Password",
                        style: labelTextStyle,
                      ),
                      SizedBox(height: 12.v),
                      TextFormField(
                        controller: singUpController.passwordController.value,
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.black26),
                        obscureText: true,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          prefixIconColor: Colors.black26,
                          suffixIcon: Icon(Icons.visibility),
                          suffixIconColor: Colors.black26,
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.black26,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          //contentPadding: EdgeInsets.only(left: 8)
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field can not be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 12.v),
                      const Text(
                        "Confirm Password",
                        style: labelTextStyle,
                      ),
                      SizedBox(height: 12.v),
                      TextFormField(
                        controller: singUpController.confirmPassController.value,
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.black),
                        obscureText: true,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          prefixIconColor: Colors.black26,
                          suffixIcon: Icon(Icons.visibility),
                          suffixIconColor: Colors.black26,
                          hintText: "Confrim Password",
                          hintStyle: TextStyle(
                            color: Colors.black26,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          //contentPadding: EdgeInsets.only(left: 8)
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field can not be empty";
                          }
                          if (value.isNotEmpty && singUpController.passwordController.value.text != value) {
                            return "Password did not match";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.v),
                CustomElevatedButton(
                    height: 45.v,
                    text: "Sign Up".tr,
                    margin: EdgeInsets.only(left: 2.h),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await singUpController.signUp();
                      }
                    }),
                SizedBox(height: 12.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: labelTextStyle,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.loginScreen);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16.fSize,
                            color: Colors.black,
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const titleTextStyle = TextStyle(
  fontSize: 26,
  color: Colors.black26,
  fontWeight: FontWeight.bold,
);

const labelTextStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF8CAAB9),
  fontWeight: FontWeight.w300,
);
