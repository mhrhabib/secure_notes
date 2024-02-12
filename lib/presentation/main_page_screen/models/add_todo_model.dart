// To parse this JSON data, do
//
//     final addTodo = addTodoFromJson(jsonString);

import 'dart:convert';

AddTodo addTodoFromJson(String str) => AddTodo.fromJson(json.decode(str));

String addTodoToJson(AddTodo data) => json.encode(data.toJson());

class AddTodo {
    int? status;
    String? message;
    Data? data;

    AddTodo({
        this.status,
        this.message,
        this.data,
    });

    factory AddTodo.fromJson(Map<String, dynamic> json) => AddTodo(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
    };
}

class Data {
    int? userId;
    String? title;
    String? description;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;

    Data({
        this.userId,
        this.title,
        this.description,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        title: json["title"],
        description: json["description"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "title": title,
        "description": description,
        "updated_at": updatedAt!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "id": id,
    };
}
