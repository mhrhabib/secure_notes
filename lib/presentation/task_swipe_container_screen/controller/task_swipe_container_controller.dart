import 'package:secure_notes/core/app_export.dart';
import 'package:secure_notes/presentation/task_swipe_container_screen/models/task_swipe_container_model.dart';

/// A controller class for the TaskSwipeContainerScreen.
///
/// This class manages the state of the TaskSwipeContainerScreen, including the
/// current taskSwipeContainerModelObj
class TaskSwipeContainerController extends GetxController {
  Rx<TaskSwipeContainerModel> taskSwipeContainerModelObj = TaskSwipeContainerModel().obs;
}
