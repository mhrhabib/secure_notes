import '../task_swipe_page/widgets/taskswipe_item_widget.dart';
import 'controller/task_swipe_controller.dart';
import 'models/task_swipe_model.dart';
import 'models/taskswipe_item_model.dart';
import 'package:secure_notes/core/app_export.dart';
import 'package:secure_notes/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';

class TaskSwipePage extends StatelessWidget {
  TaskSwipePage({Key? key})
      : super(
          key: key,
        );

  TaskSwipeController controller = Get.put(TaskSwipeController(TaskSwipeModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray5001,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillGray,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 18.v),
              Expanded(
                child: Column(
                  children: [
                    _buildStatusBarIPhone(),
                    Spacer(
                      flex: 49,
                    ),
                    _buildFrameTwentyNine(),
                    SizedBox(height: 8.v),
                    _buildTaskSwipe(),
                    Spacer(
                      flex: 50,
                    ),
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
  Widget _buildFrameTwentyNine() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 52.v,
        width: 386.h,
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 52.v,
                width: 322.h,
                margin: EdgeInsets.only(left: 10.h),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(right: 12.h),
                        child: IntrinsicWidth(
                          child: Padding(
                            padding: EdgeInsets.only(right: 14.h),
                            child: Row(
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgIconBlueGray900,
                                  height: 20.adaptSize,
                                  width: 20.adaptSize,
                                  margin: EdgeInsets.symmetric(vertical: 16.v),
                                ),
                                Container(
                                  height: 52.v,
                                  width: 48.h,
                                  margin: EdgeInsets.only(left: 242.h),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          height: 52.v,
                                          width: 48.h,
                                          decoration: BoxDecoration(
                                            color: appTheme.blueGray800,
                                          ),
                                        ),
                                      ),
                                      CustomImageView(
                                        imagePath: ImageConstant.imgIconGray5024x24,
                                        height: 24.adaptSize,
                                        width: 24.adaptSize,
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(right: 74.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.h,
                          vertical: 17.v,
                        ),
                        decoration: AppDecoration.fillCyan.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderTL5,
                        ),
                        child: Text(
                          "lbl_go_to_school".tr,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 52.v,
                width: 48.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 12.h,
                  vertical: 10.v,
                ),
                decoration: AppDecoration.fillRed.copyWith(
                  borderRadius: BorderRadiusStyle.customBorderLR5,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgDelete,
                  height: 32.v,
                  width: 24.h,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTaskSwipe() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Obx(
        () => ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 8.v,
            );
          },
          itemCount: controller.taskSwipeModelObj.value.taskswipeItemList.value.length,
          itemBuilder: (context, index) {
            TaskswipeItemModel model = controller.taskSwipeModelObj.value.taskswipeItemList.value[index];
            return TaskswipeItemWidget(
              model,
            );
          },
        ),
      ),
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
}
