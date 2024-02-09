import '../../../core/app_export.dart';
import 'taskswipe_item_model.dart';

/// This class defines the variables used in the [task_swipe_page],
/// and is typically used to hold data that is passed between different parts of the application.
class TaskSwipeModel {
  Rx<List<TaskswipeItemModel>> taskswipeItemList = Rx([
    TaskswipeItemModel(goForADinner: "Go for a dinner".obs),
    TaskswipeItemModel(goForADinner: "Go for a dinner".obs),
    TaskswipeItemModel(goForADinner: "Go for a dinner".obs),
    TaskswipeItemModel(goForADinner: "Do your homework".obs)
  ]);
}
