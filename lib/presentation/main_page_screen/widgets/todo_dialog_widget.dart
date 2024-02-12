import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure_notes/presentation/main_page_screen/widgets/edit_Todo.dart';
import 'package:secure_notes/presentation/main_page_screen/controller/todo_controller.dart';
import 'package:secure_notes/presentation/main_page_screen/models/todo_model.dart';
import 'package:secure_notes/presentation/main_page_screen/widgets/view_todo.dart';

import '../../../widgets/app_elavated_button.dart';
import '../../../widgets/laoder.dart';

// ignore: must_be_immutable
class TodoDialogWidget extends StatelessWidget {
  TodoDialogWidget({super.key, required this.todo});

  Todo todo;

  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(
          color: Color(0xFFFFC107),
        ),
      ),
      insetPadding: const EdgeInsets.all(8),
      elevation: 10,
      titlePadding: const EdgeInsets.all(0.0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 50),
            child: Text(
              'YOUR TODO',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xFF6D6767),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.cancel,
              color: Color(0xFF6D6767),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 200,
            child: AppElevatedButton(
              bgColor: const Color(0xFFFFC107),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => Dialog(
                            child: buildEditTodo(
                          controller: todoController,
                          todo: todo,
                        )));
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'EDIT',
                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 200,
            child: AppElevatedButton(
              bgColor: const Color(0xFF219653),
              onTap: () {
                Get.to(() => ViewTodo(todo: todo));
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.remove_red_eye,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'VIEW',
                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 200,
            child: AppElevatedButton(
              bgColor: const Color(0xFFEB5757),
              onTap: () async {
                todoController.deleteTodo(todo.id!);
                Navigator.of(context).pop();
              },
              child: Obx(
                () => todoController.isLoading.value
                    ? SizedBox(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width, child: const Loader())
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'DELETE',
                            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
