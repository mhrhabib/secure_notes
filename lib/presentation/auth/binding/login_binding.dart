import '../controller/login_controller.dart';
import 'package:get/get.dart';

import '../controller/singup_controller.dart';

/// A binding class for the LoginScreen.
///
/// This class ensures that the LoginController is created when the
/// LoginScreen is first loaded.
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => SingUpController());
  }
}
