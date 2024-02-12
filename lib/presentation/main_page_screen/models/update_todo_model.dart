
// To parse this JSON data, do
//
//     final updateTodo = updateTodoFromJson(jsonString);

import 'dart:convert';

UpdateTodo updateTodoFromJson(String str) => UpdateTodo.fromJson(json.decode(str));

String updateTodoToJson(UpdateTodo data) => json.encode(data.toJson());

class UpdateTodo {
    bool status;
    String message;
    Data data;

    UpdateTodo({
        required this.status,
        required this.message,
        required this.data,
    });

    factory UpdateTodo.fromJson(Map<String, dynamic> json) => UpdateTodo(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int id;
    int userId;
    String title;
    String description;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    Data({
        required this.id,
        required this.userId,
        required this.title,
        required this.description,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        description: json["description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "description": description,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
