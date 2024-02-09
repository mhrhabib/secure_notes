import '../controller/getstarted_controller.dart';
import 'package:get/get.dart';

/// A binding class for the GetstartedScreen.
///
/// This class ensures that the GetstartedController is created when the
/// GetstartedScreen is first loaded.
class GetstartedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetstartedController());
  }
}
