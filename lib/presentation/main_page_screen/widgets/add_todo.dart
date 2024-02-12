import 'package:secure_notes/core/app_export.dart';
import 'package:secure_notes/presentation/main_page_screen/controller/todo_controller.dart';
import 'package:secure_notes/widgets/custom_elevated_button.dart';
import 'package:secure_notes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

/// Section Widget
Widget buildAddTodo({BuildContext? context, TodoController? controller}) {
  return Container(
      height: 500.v,
      width: 344.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Align(
            alignment: Alignment.center,
            child: Container(
                height: 500.v,
                width: 344.h,
                padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 25.v),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), gradient: LinearGradient(begin: Alignment(0, -0.06), end: Alignment(0.91, 1), colors: [appTheme.lightBlue400, appTheme.whiteA700])),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Text(
                    'Add Todo',
                    style: TextStyle(
                      fontSize: 22.fSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 33.v),
                  CustomTextFormField(
                      controller: controller!.titleController.value,
                      hintText: "title".tr,
                      textInputAction: TextInputAction.done,
                      contentPadding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 9.v)),
                  SizedBox(height: 33.v),
                  CustomTextFormField(
                      controller: controller.descController.value,
                      hintText: "description".tr,
                      textInputAction: TextInputAction.done,
                      contentPadding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 9.v)),
                  SizedBox(height: 44.v),

                  // Add Remind Me button
                  ElevatedButton(
                    onPressed: () async {
                      DateTime? selectedDateTime = await _selectDateTime(context!);
                      if (selectedDateTime != null) {
                        controller.setReminder(selectedDateTime);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        "Remind Me",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 44.v),

                  CustomElevatedButton(
                    height: 39.v,
                    text: "Add".tr,
                    onPressed: () async {
                      await controller.addTodo();
                    },
                  ),
                ]))),
      ]));
}

Future<DateTime?> _selectDateTime(BuildContext context) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(Duration(days: 365)),
  );

  if (pickedDate != null) {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      return DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
    }
  }

  return null;
}
