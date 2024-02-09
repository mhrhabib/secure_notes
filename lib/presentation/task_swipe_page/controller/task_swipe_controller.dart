import 'package:secure_notes/core/app_export.dart';
import 'package:secure_notes/presentation/task_swipe_page/models/task_swipe_model.dart';

/// A controller class for the TaskSwipePage.
///
/// This class manages the state of the TaskSwipePage, including the
/// current taskSwipeModelObj
class TaskSwipeController extends GetxController {
  TaskSwipeController(this.taskSwipeModelObj);

  Rx<TaskSwipeModel> taskSwipeModelObj;
}
