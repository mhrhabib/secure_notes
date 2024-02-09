import 'package:secure_notes/core/app_export.dart';
import 'package:secure_notes/presentation/getstarted_screen/models/getstarted_model.dart';

/// A controller class for the GetstartedScreen.
///
/// This class manages the state of the GetstartedScreen, including the
/// current getstartedModelObj
class GetstartedController extends GetxController {
  Rx<GetstartedModel> getstartedModelObj = GetstartedModel().obs;
}
