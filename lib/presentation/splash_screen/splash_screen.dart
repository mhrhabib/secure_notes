import 'controller/splash_controller.dart';
import 'package:secure_notes/core/app_export.dart';
import 'package:flutter/material.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
                width: SizeUtils.width,
                height: SizeUtils.height,
                decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment(0, -0.06), end: Alignment(0.91, 1), colors: [appTheme.lightBlue400, appTheme.whiteA700])),
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 18.v),
                    child: Column(children: [_buildTime(), Spacer(flex: 47), Text("lbl_securenotes".tr, style: theme.textTheme.headlineMedium), Spacer(flex: 52)])))));
  }

  /// Section Widget
  Widget _buildTime() {
    return Padding(
        padding: EdgeInsets.only(right: 1.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomImageView(imagePath: ImageConstant.imgLeftSide, height: 14.v, width: 40.h),
          Spacer(flex: 67),
          Text("lbl_9_41_am".tr, style: theme.textTheme.labelLarge),
          Spacer(flex: 32),
          CustomImageView(imagePath: ImageConstant.imgAlarm, height: 9.v, width: 10.h, margin: EdgeInsets.only(top: 3.v, bottom: 2.v)),
          CustomImageView(imagePath: ImageConstant.imgBluetooth, height: 11.v, width: 6.h, margin: EdgeInsets.only(left: 6.h)),
          Padding(padding: EdgeInsets.only(left: 4.h), child: Text("lbl_100".tr, style: theme.textTheme.bodySmall)),
          CustomImageView(imagePath: ImageConstant.imgTelevision, height: 11.v, width: 26.h, margin: EdgeInsets.only(left: 3.h, top: 2.v))
        ]));
  }
}
