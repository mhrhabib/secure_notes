import '../../../core/app_export.dart';

/// This class is used in the [taskswipe_item_widget] screen.
class TaskswipeItemModel {
  TaskswipeItemModel({
    this.goForADinner,
    this.id,
  }) {
    goForADinner = goForADinner ?? Rx("Go for a dinner");
    id = id ?? Rx("");
  }

  Rx<String>? goForADinner;

  Rx<String>? id;
}
