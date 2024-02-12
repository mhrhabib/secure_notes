import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:secure_notes/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;
import '../models/todo_model.dart';
import '../repository/todo_repo.dart';

/// A controller class for the MainPageScreen.
///
/// This class manages the state of the MainPageScreen, including the
/// current mainPageModelObj
class TodoController extends GetxController {
  var todoList = <Todo>[].obs;
  var isLoading = false.obs;

  var titleController = TextEditingController().obs;
  var descController = TextEditingController().obs;

  @override
  void onInit() {
    todoListData();
    super.onInit();
  }

  void todoListData() async {
    isLoading.value = true;
    var response = await TodoRepo().getTodoList();

    if (response.isNotEmpty) {
      for (var i in response) {
        todoList.add(i);
      }
      print(todoList.map((element) => element.title).toList());
      isLoading.value = false;
    }

    update();
  }

  addTodo() async {
    isLoading.value = true;

    var response = await TodoRepo.addTdo(titleController.value.text, descController.value.text);

    if (response['status'] == 201) {
      todoList.clear();
      todoListData();
      titleController.value.clear();
      descController.value.clear();
      isLoading.value = false;
      if (reminderDateTime.value != null) {
        await scheduleNotification(); // Schedule local notification
        print('added');
      }
    }
    update();
  }

  deleteTodo(int id) async {
    isLoading.value = true;

    var response = await TodoRepo.deletTodo(id);

    if (response['status'] == true) {
      todoList.clear();
      todoListData();
      isLoading.value = false;
    }
  }

  var updateTitle = ''.obs;
  var updateDesc = ''.obs;

  updateTodo(int id) async {
    isLoading.value = true;
    var response = await TodoRepo.updateTodo(id, updateTitle.value, updateDesc.value);

    if (response['status'] == true) {
      todoList.clear();
      todoListData();
      titleController.value.clear();
      descController.value.clear();

      isLoading.value = false;
    }
  }

  Rx<DateTime?> reminderDateTime = Rx<DateTime?>(null);

  void setReminder(DateTime dateTime) {
    reminderDateTime.value = dateTime;
    print(reminderDateTime.value);
  }

  Future<void> scheduleNotification() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel 1',
      'Secure-note',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

    // Convert DateTime to TZDateTime
    tz.TZDateTime scheduledDateTime = await tz.TZDateTime.from(
      reminderDateTime.value!,
      tz.local,
    );

    // Schedule the notification
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Todo Reminder',
      'Don\'t forget about your todo: ${titleController.value.text}',
      scheduledDateTime,
      platformChannelSpecifics,
      // ignore: deprecated_member_use
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
