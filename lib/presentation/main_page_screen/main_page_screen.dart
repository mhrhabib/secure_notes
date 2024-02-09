import 'controller/main_page_controller.dart';
import 'package:secure_notes/core/app_export.dart';
import 'package:secure_notes/presentation/task_swipe_page/task_swipe_page.dart';
import 'package:secure_notes/widgets/custom_bottom_bar.dart';
import 'package:secure_notes/widgets/custom_floating_button.dart';
import 'package:secure_notes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class MainPageScreen extends GetWidget<MainPageController> {
  const MainPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.gray5001,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 18.v),
              Expanded(
                child: Column(
                  children: [
                    _buildStatusBarIPhone(),
                    SizedBox(height: 31.v),
                    _buildFrameTwentyOne(),
                    SizedBox(height: 53.v),
                    _buildTaskOne(),
                    SizedBox(height: 16.v),
                    _buildTaskOne1(),
                    SizedBox(height: 16.v),
                    _buildTaskOne2(),
                    SizedBox(height: 16.v),
                    _buildTaskFour(),
                    Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 171.h,
                          right: 48.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusStyle.roundedBorder10,
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 24.h,
                                vertical: 17.v,
                              ),
                              decoration: AppDecoration.fillIndigo.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder5,
                              ),
                              child: Text(
                                "lbl_create_new_task".tr,
                                style: CustomTextStyles.bodySmallInterOnErrorContainer,
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgArrowDownIndigo50,
                              height: 15.v,
                              width: 26.h,
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(right: 20.h),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(),
        floatingActionButton: _buildFloatingActionButton(),
      ),
    );
  }

  /// Section Widget
  Widget _buildStatusBarIPhone() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
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

  /// Section Widget
  Widget _buildFrameTwentyOne() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 137.h,
        vertical: 15.v,
      ),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "lbl_task".tr,
              style: theme.textTheme.titleLarge,
            ),
            TextSpan(
              text: " ",
            ),
            TextSpan(
              text: "lbl_list".tr,
              style: theme.textTheme.titleLarge,
            ),
          ],
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  /// Section Widget
  Widget _buildTaskOne() {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.h,
        right: 14.h,
      ),
      child: CustomTextFormField(
        controller: controller.taskOneController,
        hintText: "lbl_go_to_school".tr,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(12.h, 16.v, 8.h, 16.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgIconBlueGray900,
            height: 20.adaptSize,
            width: 20.adaptSize,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 52.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTaskOne1() {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.h,
        right: 14.h,
      ),
      child: CustomTextFormField(
        controller: controller.taskOneController1,
        hintText: "lbl_go_to_school".tr,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(12.h, 16.v, 8.h, 16.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgIconBlueGray900,
            height: 20.adaptSize,
            width: 20.adaptSize,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 52.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTaskOne2() {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.h,
        right: 14.h,
      ),
      child: CustomTextFormField(
        controller: controller.taskOneController2,
        hintText: "lbl_go_to_school".tr,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(12.h, 16.v, 8.h, 16.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgIconBlueGray900,
            height: 20.adaptSize,
            width: 20.adaptSize,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 52.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTaskFour() {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.h,
        right: 14.h,
      ),
      child: CustomTextFormField(
        controller: controller.taskFourController,
        hintText: "lbl_go_for_a_dinner".tr,
        textInputAction: TextInputAction.done,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(12.h, 16.v, 8.h, 16.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgIconBlueGray900,
            height: 20.adaptSize,
            width: 20.adaptSize,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 52.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Get.toNamed(getCurrentRoute(type), id: 1);
      },
    );
  }

  /// Section Widget
  Widget _buildFloatingActionButton() {
    return CustomFloatingButton(
      height: 60,
      width: 60,
      backgroundColor: theme.colorScheme.primaryContainer,
      child: CustomImageView(
        imagePath: ImageConstant.imgIconGray50,
        height: 30.0.v,
        width: 30.0.h,
      ),
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Menu:
        return AppRoutes.taskSwipePage;
      case BottomBarEnum.Tasks:
        return "/";
      case BottomBarEnum.Calendar:
        return "/";
      case BottomBarEnum.Profile:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.taskSwipePage:
        return TaskSwipePage();
      default:
        return DefaultWidget();
    }
  }
}
