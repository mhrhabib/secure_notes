import 'package:secure_notes/core/app_export.dart';
import 'package:secure_notes/presentation/add_todo_screen/models/add_todo_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the AddTodoScreen.
///
/// This class manages the state of the AddTodoScreen, including the
/// current addTodoModelObj
class AddTodoController extends GetxController {
  TextEditingController taskController = TextEditingController();

  Rx<AddTodoModel> addTodoModelObj = AddTodoModel().obs;

  @override
  void onClose() {
    super.onClose();
    taskController.dispose();
  }
}
