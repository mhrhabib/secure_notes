import 'package:secure_notes/core/app_export.dart';
import 'package:secure_notes/widgets/custom_elevated_button.dart';
import 'package:secure_notes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

/// Section Widget
Widget buildEditTodo() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 31.v),
      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment(0, -0.06), end: Alignment(0.91, 1), colors: [appTheme.lightBlue400, appTheme.whiteA700])),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        CustomElevatedButton(text: "lbl_edit_todo".tr, buttonStyle: CustomButtonStyles.fillBlue, buttonTextStyle: CustomTextStyles.titleLargeWhiteA700),
        SizedBox(height: 43.v),
        CustomTextFormField(hintText: "lbl_buy_crypto".tr, textInputAction: TextInputAction.done, contentPadding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 9.v)),
        SizedBox(height: 55.v),
        CustomElevatedButton(height: 45.v, text: "lbl_update".tr, onPressed: () {})
      ]));
}
