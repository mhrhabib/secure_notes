import 'controller/add_todo_controller.dart';
import 'package:secure_notes/core/app_export.dart';
import 'package:secure_notes/widgets/custom_elevated_button.dart';
import 'package:secure_notes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddTodoScreen extends GetWidget<AddTodoController> {
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
            body: Container(
                width: SizeUtils.width,
                height: SizeUtils.height,
                decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment(0, -0.06), end: Alignment(0.91, 1), colors: [appTheme.lightBlue400, appTheme.whiteA700])),
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 18.v),
                    child: Column(children: [_buildStatusBarIPhone(), Spacer(flex: 22), _buildThree(), Spacer(flex: 77)])))));
  }

  /// Section Widget
  Widget _buildStatusBarIPhone() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomImageView(imagePath: ImageConstant.imgLeftSide, height: 14.v, width: 40.h),
          Spacer(flex: 68),
          Text("lbl_9_41_am".tr, style: theme.textTheme.labelLarge),
          Spacer(flex: 31),
          CustomImageView(imagePath: ImageConstant.imgClock, height: 14.adaptSize, width: 14.adaptSize),
          CustomImageView(imagePath: ImageConstant.imgBluetooth, height: 14.adaptSize, width: 14.adaptSize, margin: EdgeInsets.only(left: 1.h)),
          Text("lbl_100".tr, style: theme.textTheme.bodySmall),
          CustomImageView(imagePath: ImageConstant.imgTelevision, height: 11.v, width: 26.h, margin: EdgeInsets.only(left: 3.h, top: 2.v))
        ]));
  }

  /// Section Widget
  Widget _buildThree() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 31.v),
        decoration: AppDecoration.fillWhiteA.copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          CustomElevatedButton(text: "lbl_edit_todo".tr, buttonStyle: CustomButtonStyles.fillBlue, buttonTextStyle: CustomTextStyles.titleLargeWhiteA700),
          SizedBox(height: 43.v),
          CustomTextFormField(
              controller: controller.taskController, hintText: "lbl_buy_crypto".tr, textInputAction: TextInputAction.done, contentPadding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 9.v)),
          SizedBox(height: 55.v),
          CustomElevatedButton(
              height: 45.v,
              text: "lbl_update".tr,
              onPressed: () {
                onTapUpdate();
              })
        ]));
  }

  /// Navigates to the taskSwipeContainerScreen when the action is triggered.
  onTapUpdate() {
    Get.toNamed(
      AppRoutes.taskSwipeContainerScreen,
    );
  }
}
