import '../../../core/app_export.dart';
import '../../../core/network/base_client.dart';
import '../../../core/utils/urls.dart';
import '../models/todo_model.dart';
import 'package:dio/dio.dart' as dio;

class TodoRepo {
  Future<List<Todo>> getTodoList() async {
    try {
      dio.Response response = await BaseClient.get(url: Urls.todoList);

      if (response.statusCode == 200) {
        print(response.data);

        TodoModel todoModel = TodoModel.fromJson(response.data);

        List<Todo> todoList = todoModel.datas!;

        return todoList;
      } else {
        print(">>>>>>>>>>>>>>>>>>>>>>>>");
        print(response.statusCode);
        throw "todoList erorr";
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future addTdo(String title, String desc) async {
    var data = {
      'title': title,
      'description': desc,
    };

    print(data);

    try {
      dio.Response response = await BaseClient.post(
        url: Urls.addTodo,
        payload: data,
      );
      if (response.statusCode == 200) {
        Get.back();
        Get.snackbar('Success', 'Todo added');
        return response.data;
      } else {
        throw "${response.statusCode}";
      }
    } on dio.DioException catch (e) {
      Get.snackbar("error", e.message.toString());
      rethrow;
    }
  }

  static Future deletTodo(int id) async {
    try {
      dio.Response response = await BaseClient.get(url: Urls.deleteTodo + "$id");

      if (response.statusCode == 200) {
        Get.snackbar("Success", "Delete todo successfull");

        return response.data;
      }
      throw "${response.statusCode}";
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future updateTodo(int id, String title, String desc) async {
    var data = {
      'id': id,
      'title': title,
      'description': desc,
    };

    try {
      dio.Response response = await BaseClient.post(
        url: Urls.updateTodo,
        payload: data,
      );
      if (response.statusCode == 200) {
        Get.back();
        Get.snackbar('Success', 'Todo added');

        return response.data;
      } else {
        throw "${response.statusCode}";
      }
    } on dio.DioException catch (e) {
      Get.snackbar("error", e.message.toString());
      rethrow;
    }
  }
}
