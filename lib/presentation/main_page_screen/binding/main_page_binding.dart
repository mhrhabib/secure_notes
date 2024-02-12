import '../controller/todo_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MainPageScreen.
///
/// This class ensures that the MainPageController is created when the
/// MainPageScreen is first loaded.
class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TodoController());
  }
}
