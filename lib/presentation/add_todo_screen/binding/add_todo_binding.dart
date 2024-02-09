import '../controller/add_todo_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddTodoScreen.
///
/// This class ensures that the AddTodoController is created when the
/// AddTodoScreen is first loaded.
class AddTodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddTodoController());
  }
}
