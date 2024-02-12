import 'package:secure_notes/core/app_export.dart';
import 'package:secure_notes/data/apiClient/api_client.dart';
import 'package:secure_notes/presentation/main_page_screen/controller/main_page_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(ApiClient());
    Get.lazyPut(() => MainPageController());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
  }
}
