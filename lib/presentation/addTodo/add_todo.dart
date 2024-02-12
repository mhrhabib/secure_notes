import 'package:secure_notes/core/app_export.dart';
import 'package:secure_notes/widgets/custom_elevated_button.dart';
import 'package:secure_notes/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

/// Section Widget
Widget buildAddTodo() {
  return Container(
      height: 284.v,
      width: 344.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Align(
            alignment: Alignment.center,
            child: Container(
                height: 284.v,
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
                  CustomTextFormField(hintText: "lbl_buy_crypto".tr, textInputAction: TextInputAction.done, contentPadding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 9.v)),
                  SizedBox(height: 44.v),
                  CustomElevatedButton(height: 39.v, text: "Add".tr, onPressed: () {}),
                ]))),
      ]));
}
