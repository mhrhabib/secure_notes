import 'package:secure_notes/core/app_export.dart';
import 'package:secure_notes/presentation/main_page_screen/models/main_page_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the MainPageScreen.
///
/// This class manages the state of the MainPageScreen, including the
/// current mainPageModelObj
class MainPageController extends GetxController {
  TextEditingController taskOneController = TextEditingController();

  TextEditingController taskOneController1 = TextEditingController();

  TextEditingController taskOneController2 = TextEditingController();

  TextEditingController taskFourController = TextEditingController();

  Rx<MainPageModel> mainPageModelObj = MainPageModel().obs;

  @override
  void onClose() {
    super.onClose();
    taskOneController.dispose();
    taskOneController1.dispose();
    taskOneController2.dispose();
    taskFourController.dispose();
  }
}
