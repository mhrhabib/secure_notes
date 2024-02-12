import '../addTodo/add_todo.dart';
import 'controller/main_page_controller.dart';
import 'package:secure_notes/core/app_export.dart';
import 'package:secure_notes/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';

class MainPageScreen extends GetWidget<MainPageController> {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.gray5001,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 18.v),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 12.v),
                    _buildFrame(),
                    Expanded(child: _buildTheList()),
                  ],
                ),
              ),
            ],
          ),
        ),
        //bottomNavigationBar: _buildBottomBar(),
        floatingActionButton: _buildFloatingActionButton(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 137.h,
        vertical: 15.v,
      ),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "lbl_task".tr,
              style: theme.textTheme.titleLarge,
            ),
            TextSpan(
              text: "",
            ),
            TextSpan(
              text: "lbl_list".tr,
              style: theme.textTheme.titleLarge,
            ),
          ],
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  /// Section Widget
  Widget _buildFloatingActionButton(BuildContext context) {
    return CustomFloatingButton(
      height: 60,
      width: 60,
      onTap: () {
        showDialog(context: context, builder: (context) => Dialog(child: buildAddTodo()));
      },
      backgroundColor: theme.colorScheme.primaryContainer,
      child: CustomImageView(
        imagePath: ImageConstant.imgIconGray50,
        color: Colors.white,
        height: 30.0.v,
        width: 30.0.h,
      ),
    );
  }

  //section widget
  Widget _buildTheList() {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Text(
              "${index + 1}",
              style: theme.textTheme.titleLarge,
            ),
          ),
          title: Text(
            'The task',
            style: theme.textTheme.titleLarge!.copyWith(color: Colors.black),
            overflow: TextOverflow.clip,
          ),
          trailing: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined)),
        );
      },
    );
  }
}
