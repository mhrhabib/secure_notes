import 'controller/task_swipe_container_controller.dart';
import 'package:secure_notes/core/app_export.dart';
import 'package:secure_notes/presentation/task_swipe_page/task_swipe_page.dart';
import 'package:secure_notes/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

class TaskSwipeContainerScreen extends GetWidget<TaskSwipeContainerController> {
  const TaskSwipeContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: Get.nestedKey(1),
                initialRoute: AppRoutes.taskSwipePage,
                onGenerateRoute: (routeSetting) => GetPageRoute(page: () => getCurrentPage(routeSetting.name!), transition: Transition.noTransition)),
            bottomNavigationBar: _buildBottomBar()));
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Get.toNamed(getCurrentRoute(type), id: 1);
    });
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
