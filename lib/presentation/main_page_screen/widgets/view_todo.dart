import 'package:flutter/material.dart';
import 'package:secure_notes/core/app_export.dart';
import 'package:secure_notes/presentation/main_page_screen/models/todo_model.dart';

class ViewTodo extends StatelessWidget {
  const ViewTodo({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Todo'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white24,
        ),
        child: Container(
          height: 200.adaptSize,
          width: 320.adaptSize,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          margin: EdgeInsets.only(top: 20.v),
          decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Title:",
                    style: TextStyle(
                      fontSize: 20.fSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    todo.title!,
                    style: TextStyle(fontSize: 20.fSize),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Description:",
                    style: TextStyle(
                      fontSize: 20.fSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    todo.description!,
                    style: TextStyle(fontSize: 16.fSize),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
