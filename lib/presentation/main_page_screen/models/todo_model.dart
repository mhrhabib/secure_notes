// To parse this JSON data, do
//
//     final todoModel = todoModelFromJson(jsonString);

import 'dart:convert';

TodoModel todoModelFromJson(String str) => TodoModel.fromJson(json.decode(str));

String todoModelToJson(TodoModel data) => json.encode(data.toJson());

class TodoModel {
    int? code;
    bool? status;
    List<Todo>? datas;

    TodoModel({
        this.code,
        this.status,
        this.datas,
    });

    factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        code: json["code"],
        status: json["status"],
        datas: List<Todo>.from(json["datas"].map((x) => Todo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "datas": List<dynamic>.from(datas!.map((x) => x.toJson())),
    };
}

class Todo {
    int? id;
    String? userId;
    String? title;
    String? description;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    Todo({
        this.id,
        this.userId,
        this.title,
        this.description,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory Todo.fromJson(Map<String, dynamic> json) => Todo(
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
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
