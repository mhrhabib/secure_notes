import 'controller/login_controller.dart';
import 'package:secure_notes/core/app_export.dart';
import 'package:secure_notes/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import 'signup_screen.dart';

class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print('>>>>>>>user ${controller.user}');
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.cyan50,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 14.h, top: 12.v, right: 14.h, bottom: 40.v),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Row(
                    children: [
                      CustomImageView(imagePath: ImageConstant.imgArrowDown, height: 24.adaptSize, width: 24.adaptSize, margin: EdgeInsets.only(bottom: 3.v)),
                      Padding(padding: EdgeInsets.only(left: 110.h), child: Text("lbl_login".tr, style: CustomTextStyles.titleLargePrimary))
                    ],
                  ),
                ),
                SizedBox(height: 20.v),
                _buildContinueWithGmail(),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "You have to signed up through email add password use this app as i have this api of todo. and its not connected with gmail sign in, but i have done the part where you can sign in with gmail and get the profile from firebase.",
                    style: TextStyle(fontSize: 16.fSize),
                  ),
                ),
                SizedBox(height: 12.v),
                Obx(
                  () => controller.user.value != null ? Text('sign out from Firebase with gmail') : SizedBox.shrink(),
                ),
                Obx(
                  () => controller.user.value != null
                      ? CircleAvatar(
                          child: IconButton(
                              onPressed: () async {
                                await controller.signOut();
                              },
                              icon: Icon(
                                Icons.logout_rounded,
                                color: Colors.white,
                              )))
                      : SizedBox.shrink(),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Email Address",
                        style: labelTextStyle,
                      ),
                      SizedBox(height: 12.v),
                      TextFormField(
                        controller: controller.emailController.value,
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_2_outlined),
                          prefixIconColor: Colors.black26,
                          hintText: "Example@gmail.com",
                          hintStyle: TextStyle(
                            color: Colors.black26,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                          //contentPadding: EdgeInsets.only(left: 8)
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field cann't be empty";
                          }
                          if (value.isNotEmpty && !value.contains("@")) {
                            return "Email is not valid";
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
                      Obx(
                        () => TextFormField(
                          controller: controller.passwordController.value,
                          textAlign: TextAlign.left,
                          style: const TextStyle(color: Colors.black),
                          obscureText: controller.isVisible.value == true ? true : false,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            prefixIconColor: Colors.black26,
                            suffixIcon: InkWell(
                              onTap: () => controller.visibilityToggle(),
                              child: controller.isVisible.value ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                            ),
                            suffixIconColor: Colors.black26,
                            hintText: "Password",
                            hintStyle: const TextStyle(
                              color: Colors.black26,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                            //contentPadding: EdgeInsets.only(left: 8)
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cann't be empty";
                            }
                            if (value.isNotEmpty && value.length < 4) {
                              return "Password must be at least 4 character";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.v),
                CustomElevatedButton(
                    height: 45.v,
                    text: "Log in".tr,
                    margin: EdgeInsets.only(left: 2.h),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await controller.loginWithEmail();
                      }
                    }),
                SizedBox(height: 20.v),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: labelTextStyle,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.signUpScreen);
                      },
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                          fontSize: 20.fSize,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildContinueWithGmail() {
    return Obx(
      () => controller.user.value == null
          ? CustomElevatedButton(
              height: 45.v,
              text: "msg_continue_with_g_mail".tr,
              margin: EdgeInsets.only(left: 2.h),
              onPressed: () async {
                await controller.signInWithGoogle();
              })
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 90.adaptSize,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(70.adaptSize),
                    child: CustomImageView(
                      height: 140.adaptSize,
                      imagePath: controller.user.value!.photoURL,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 12.v),
                Text(
                  'Welcome, ${controller.user.value!.displayName}',
                  style: TextStyle(fontSize: 18.fSize),
                ),
                SizedBox(height: 12.h),
              ],
            ),
    );
  }

  /// Section Widget
  Widget _buildOr() {
    return CustomElevatedButton(
        height: 33.v, width: 44.h, text: "lbl_or".tr, buttonStyle: CustomButtonStyles.fillCyan, buttonTextStyle: CustomTextStyles.bodyMediumGray900_1, alignment: Alignment.center);
  }

  /// Section Widget
  Widget _buildFrameNine() {
    return Container(
        height: 33.v,
        width: 330.h,
        margin: EdgeInsets.only(left: 2.h),
        child: Stack(alignment: Alignment.center, children: [
          Align(alignment: Alignment.bottomCenter, child: Padding(padding: EdgeInsets.only(bottom: 14.v), child: SizedBox(width: 330.h, child: Divider(color: appTheme.gray900.withOpacity(0.3))))),
          _buildOr()
        ]));
  }
}
