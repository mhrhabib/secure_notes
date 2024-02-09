import 'package:secure_notes/core/app_export.dart';
import 'package:secure_notes/presentation/edit_todo_screen/models/edit_todo_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the EditTodoScreen.
///
/// This class manages the state of the EditTodoScreen, including the
/// current editTodoModelObj
class EditTodoController extends GetxController {
  TextEditingController todoController = TextEditingController();

  Rx<EditTodoModel> editTodoModelObj = EditTodoModel().obs;

  @override
  void onClose() {
    super.onClose();
    todoController.dispose();
  }
}
