import 'package:secure_notes/presentation/auth/repo/log_out_repo.dart';
import 'package:secure_notes/presentation/main_page_screen/widgets/todo_dialog_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'widgets/add_todo.dart';
import 'controller/todo_controller.dart';
import 'package:secure_notes/core/app_export.dart';
import 'package:secure_notes/widgets/custom_floating_button.dart';
import 'package:flutter/material.dart';

class MainPageScreen extends GetWidget<TodoController> {
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
        horizontal: 12.h,
        vertical: 15.v,
      ),
      margin: EdgeInsets.only(left: 8, right: 8),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
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
          IconButton(
              onPressed: () async {
                await LogOutRepo.logOut();
              },
              icon: Icon(
                Icons.logout_rounded,
                color: Colors.white,
              ))
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFloatingActionButton(BuildContext context) {
    return CustomFloatingButton(
      height: 60,
      width: 60,
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => Dialog(
                    child: buildAddTodo(
                  context: context,
                  controller: controller,
                )));
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
    return Obx(
      () => controller.isLoading.value
          ? Shimmer.fromColors(
              child: ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        "${index + 1}",
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    title: Container(
                      height: 12,
                      width: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                      child: Text(
                        "",
                        style: theme.textTheme.titleLarge!.copyWith(color: Colors.black),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    subtitle: Container(
                      height: 12,
                      width: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                      child: Text(
                        '',
                        style: theme.textTheme.titleMedium!.copyWith(color: Colors.black),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    trailing: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined)),
                  );
                },
              ),
              baseColor: Colors.grey,
              highlightColor: Colors.white,
            )
          : controller.todoList.isEmpty
              ? Center(
                  child: Text("Empty"),
                )
              : ListView.builder(
                  itemCount: controller.todoList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          "${index + 1}",
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      title: Text(
                        controller.todoList[index].title!,
                        style: theme.textTheme.titleLarge!.copyWith(color: Colors.black),
                        overflow: TextOverflow.clip,
                      ),
                      subtitle: Text(
                        controller.todoList[index].description ?? '',
                        style: theme.textTheme.titleMedium!.copyWith(color: Colors.black),
                        overflow: TextOverflow.clip,
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            Get.dialog(TodoDialogWidget(
                              todo: controller.todoList[index],
                            ));
                          },
                          icon: Icon(Icons.more_vert_outlined)),
                    );
                  },
                ),
    );
  }
}
