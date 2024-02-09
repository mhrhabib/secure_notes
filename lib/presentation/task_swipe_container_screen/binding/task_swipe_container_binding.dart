import '../controller/task_swipe_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the TaskSwipeContainerScreen.
///
/// This class ensures that the TaskSwipeContainerController is created when the
/// TaskSwipeContainerScreen is first loaded.
class TaskSwipeContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskSwipeContainerController());
  }
}
