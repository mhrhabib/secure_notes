import 'package:secure_notes/core/app_export.dart';
import 'package:secure_notes/data/apiClient/api_client.dart';
import 'package:secure_notes/presentation/main_page_screen/controller/todo_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(ApiClient());
    Get.lazyPut(() => TodoController());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
  }
}
