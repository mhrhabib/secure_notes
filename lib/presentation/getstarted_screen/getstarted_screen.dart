import 'controller/getstarted_controller.dart';
import 'package:secure_notes/core/app_export.dart';
import 'package:secure_notes/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class GetstartedScreen extends GetWidget<GetstartedController> {
  const GetstartedScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0, -0.06),
              end: Alignment(0.91, 1),
              colors: [
                appTheme.lightBlue400,
                appTheme.whiteA700,
              ],
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 18.v,
            ),
            child: Column(
              children: [
                _buildStatusBarIPhone(),
                SizedBox(height: 63.v),
                CustomImageView(
                  imagePath: ImageConstant.imgToDoListPana,
                  height: 301.adaptSize,
                  width: 301.adaptSize,
                ),
                SizedBox(height: 69.v),
                Text(
                  "lbl_securenotes".tr,
                  style: theme.textTheme.headlineMedium,
                ),
                SizedBox(height: 11.v),
                Container(
                  width: 226.h,
                  margin: EdgeInsets.only(
                    left: 47.h,
                    right: 46.h,
                  ),
                  child: Text(
                    "msg_here_you_can_plan".tr,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.bodyMediumGray900.copyWith(
                      height: 1.21,
                    ),
                  ),
                ),
                SizedBox(height: 79.v),
                CustomElevatedButton(
                  width: 114.h,
                  text: "lbl_get_started".tr,
                  buttonStyle: CustomButtonStyles.outlinePrimary,
                ),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildStatusBarIPhone() {
    return Padding(
      padding: EdgeInsets.only(right: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgLeftSide,
            height: 14.v,
            width: 40.h,
          ),
          Spacer(
            flex: 68,
          ),
          Text(
            "lbl_9_41_am".tr,
            style: theme.textTheme.labelLarge,
          ),
          Spacer(
            flex: 31,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgClock,
            height: 14.adaptSize,
            width: 14.adaptSize,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgBluetooth,
            height: 14.adaptSize,
            width: 14.adaptSize,
            margin: EdgeInsets.only(left: 1.h),
          ),
          Text(
            "lbl_100".tr,
            style: theme.textTheme.bodySmall,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgTelevision,
            height: 11.v,
            width: 26.h,
            margin: EdgeInsets.only(
              left: 3.h,
              top: 2.v,
            ),
          ),
        ],
      ),
    );
  }
}
