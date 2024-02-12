import 'controller/login_controller.dart';
import 'package:secure_notes/core/app_export.dart';
import 'package:secure_notes/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.cyan50,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(left: 14.h, top: 97.v, right: 14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(height: 58.v),
              _buildContinueWithGmail(),
              SizedBox(height: 43.v),
              _buildFrameNine(),
              SizedBox(height: 44.v),
              _buildLoginWithFacebook(),
              SizedBox(height: 12.v),
              _buildLoginWithTwitter(),
              SizedBox(height: 12.v),
              _buildLoginWithInstagram(),
              SizedBox(height: 5.v)
            ],
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
              children: [
                Text(
                  'Welcome, ${controller.user.value!.displayName}',
                  style: TextStyle(fontSize: 18.fSize),
                ),
                SizedBox(height: 12.h),
                CustomElevatedButton(
                    height: 45.v,
                    text: "Go to home page".tr,
                    margin: EdgeInsets.only(left: 2.h),
                    onPressed: () async {
                      Get.toNamed(AppRoutes.mainPageScreen);
                    }),
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

  /// Section Widget
  Widget _buildLoginWithFacebook() {
    return CustomElevatedButton(
        text: "msg_login_with_facebook".tr,
        margin: EdgeInsets.only(left: 2.h),
        leftIcon: Container(margin: EdgeInsets.only(right: 12.h), child: CustomImageView(imagePath: ImageConstant.imgIcon, height: 14.adaptSize, width: 14.adaptSize)),
        buttonStyle: CustomButtonStyles.outlinePrimaryTL51,
        buttonTextStyle: CustomTextStyles.labelLargeInterBluegray700,
        onPressed: () {});
  }

  /// Section Widget
  Widget _buildLoginWithTwitter() {
    return CustomElevatedButton(
        text: "msg_login_with_twitter".tr,
        margin: EdgeInsets.only(left: 2.h),
        leftIcon: Container(margin: EdgeInsets.only(right: 9.h), child: CustomImageView(imagePath: ImageConstant.imgIconOnsecondarycontainer, height: 14.adaptSize, width: 14.adaptSize)),
        buttonStyle: CustomButtonStyles.outlinePrimaryTL51,
        buttonTextStyle: CustomTextStyles.labelLargeInterBluegray700);
  }

  /// Section Widget
  Widget _buildLoginWithInstagram() {
    return CustomElevatedButton(
        text: "msg_login_with_instagram".tr,
        margin: EdgeInsets.only(left: 2.h),
        leftIcon: Container(margin: EdgeInsets.only(right: 12.h), child: CustomImageView(imagePath: ImageConstant.imgIconOnsecondarycontainer14x14, height: 14.adaptSize, width: 14.adaptSize)),
        buttonStyle: CustomButtonStyles.outlinePrimaryTL51,
        buttonTextStyle: CustomTextStyles.labelLargeInterBluegray700);
  }

  /// Navigates to the taskSwipeContainerScreen when the action is triggered.
  onTapContinueWithGmail() {
    Get.toNamed(
      AppRoutes.mainPageScreen,
    );
  }
}
