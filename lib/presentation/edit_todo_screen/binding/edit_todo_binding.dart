import '../controller/edit_todo_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EditTodoScreen.
///
/// This class ensures that the EditTodoController is created when the
/// EditTodoScreen is first loaded.
class EditTodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditTodoController());
  }
}
