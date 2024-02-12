// To parse this JSON data, do
//
//     final deleteTodo = deleteTodoFromJson(jsonString);

import 'dart:convert';

DeleteTodo deleteTodoFromJson(String str) => DeleteTodo.fromJson(json.decode(str));

String deleteTodoToJson(DeleteTodo data) => json.encode(data.toJson());

class DeleteTodo {
    bool status;
    String message;

    DeleteTodo({
        required this.status,
        required this.message,
    });

    factory DeleteTodo.fromJson(Map<String, dynamic> json) => DeleteTodo(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
