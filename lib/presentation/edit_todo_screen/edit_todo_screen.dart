import 'controller/edit_todo_controller.dart';
import 'package:secure_notes/core/app_export.dart';
import 'package:secure_notes/widgets/custom_elevated_button.dart';
import 'package:secure_notes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EditTodoScreen extends GetWidget<EditTodoController> {
  const EditTodoScreen({Key? key}) : super(key: key);

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
                    child: Column(children: [_buildStatusBarIPhone(), Spacer(flex: 31), _buildSix(), Spacer(flex: 68)])))));
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
  Widget _buildSix() {
    return SizedBox(
        height: 284.v,
        width: 344.h,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 25.v),
                  decoration: AppDecoration.fillWhiteA.copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    CustomElevatedButton(height: 35.v, text: "lbl_add_todo".tr, buttonStyle: CustomButtonStyles.fillBlue, buttonTextStyle: CustomTextStyles.titleLargeWhiteA700),
                    SizedBox(height: 33.v),
                    CustomTextFormField(
                        controller: controller.todoController,
                        hintText: "lbl_buy_crypto".tr,
                        textInputAction: TextInputAction.done,
                        contentPadding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 9.v)),
                    SizedBox(height: 44.v),
                    CustomElevatedButton(
                        height: 39.v,
                        text: "lbl_update".tr,
                        onPressed: () {
                          onTapUpdate();
                        }),
                    SizedBox(height: 35.v)
                  ]))),
          Align(alignment: Alignment.bottomCenter, child: Padding(padding: EdgeInsets.only(bottom: 59.v), child: Text("lbl_securenotes".tr, style: theme.textTheme.headlineMedium)))
        ]));
  }

  /// Navigates to the taskSwipeContainerScreen when the action is triggered.
  onTapUpdate() {
    Get.toNamed(
      AppRoutes.taskSwipeContainerScreen,
    );
  }
}
