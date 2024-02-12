import 'package:secure_notes/core/app_export.dart';
import 'package:secure_notes/presentation/main_page_screen/controller/todo_controller.dart';
import 'package:secure_notes/presentation/main_page_screen/models/todo_model.dart';
import 'package:secure_notes/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

/// Section Widget
Widget buildEditTodo({TodoController? controller, Todo? todo}) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 31.v),
      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment(0, -0.06), end: Alignment(0.91, 1), colors: [appTheme.lightBlue400, appTheme.whiteA700])),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          'Edit Todo',
          style: TextStyle(
            fontSize: 22.fSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 33.v),
        AppTextFieldWidget(
          initialValue: todo!.title,
          hintText: 'title',
          onChanged: (val) {
            controller!.updateTitle.value = val;
          },
        ),
        SizedBox(height: 33.v),
        AppTextFieldWidget(
          initialValue: todo.description,
          hintText: "description",
          onChanged: (val) {
            controller!.updateDesc.value = val;
          },
        ),
        SizedBox(height: 55.v),
        CustomElevatedButton(
            height: 45.v,
            text: "lbl_update".tr,
            onPressed: () async {
              if (controller!.updateTitle == '') {
                controller.updateTitle.value = todo.title!;
              }
              if (controller.updateDesc == '') {
                controller.updateDesc.value = todo.description!;
              }
              await controller.updateTodo(todo.id!);
              Navigator.of(Get.context!).pop();
            })
      ]));
}

class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget({super.key, required this.hintText, this.onChanged, this.controller, this.obscureText, this.maxLines, this.initialValue, this.validator, this.readOnly, this.keyboardType});
  final String hintText;
  final TextEditingController? controller;
  final bool? obscureText;
  final void Function(String)? onChanged;
  final int? maxLines;
  final Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText ?? false,
        maxLines: maxLines ?? 1,
        readOnly: readOnly ?? false,
        validator: (value) {
          if (validator != null) {
            return validator!(value);
          }
          return null;
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Color(0xFF6D6767)),
          filled: true,
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
