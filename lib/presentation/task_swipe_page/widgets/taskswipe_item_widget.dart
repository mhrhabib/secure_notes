import '../controller/task_swipe_controller.dart';
import '../models/taskswipe_item_model.dart';
import 'package:secure_notes/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TaskswipeItemWidget extends StatelessWidget {
  TaskswipeItemWidget(
    this.taskswipeItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  TaskswipeItemModel taskswipeItemModelObj;

  var controller = Get.find<TaskSwipeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.outlinePrimary1.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgIconBlueGray900,
            height: 20.adaptSize,
            width: 20.adaptSize,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: Obx(
              () => Text(
                taskswipeItemModelObj.goForADinner!.value,
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
