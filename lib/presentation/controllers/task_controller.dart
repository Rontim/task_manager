import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:task_manager/app_injector.dart';
import 'package:task_manager/core/logger_service.dart';
import 'package:task_manager/domain/entities/task.dart';
import 'package:task_manager/domain/usecases/fetch_tasks_usecase.dart';

class TaskController extends GetxController {
  static const int pageSize = 10;

  final logger = locator<LoggerService>();
  final PagingController<int, Task> pagingController =
      PagingController(firstPageKey: 0);

  // Reactive variables to hold the state
  var tasks = <Task>[].obs;
  var isLoading = false.obs;
  final _query = ''.obs;

  final FetchTasksUseCase fetchTasksUseCase = locator<FetchTasksUseCase>();

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      getTasks(pageKey);
    }); // Fetch tasks when controller is initialized
  }

  // Method to fetch all tasks
  Future<void> getTasks(int pageKey) async {
    try {
      isLoading(true); // Start loading
      Future.delayed(const Duration(seconds: 2)); // Simulate network delay
      final taskList = await fetchTasksUseCase(
          pageKey, pageSize, _query.value); // Call use case to fetch tasks
      final isLastPage = taskList.length < pageSize;
      if (isLastPage) {
        pagingController
            .appendLastPage(taskList); // Assign tasks to the reactive list
      } else {
        final nextPageKey = pageKey + taskList.length;
        pagingController.appendPage(
            taskList, nextPageKey); // Assign tasks to the reactive list
      }
    } catch (e) {
      logger.logError(e.toString());
    } finally {
      isLoading(false); // Stop loading
    }
  }

  // Method to delete a task
  Future<void> deleteTask(int taskId) async {
    // try {
    //   await deleteTaskUseCase(taskId); // Call use case to delete task
    //   tasks.removeWhere((task) => task.id == taskId); // Remove task from list
    //   Get.snackbar('Success', 'Task deleted successfully');
    // } catch (e) {
    //   Get.snackbar('Error', 'Failed to delete task');
    // }
  }

  Future<void> searchTaskByTitle(String query) async {
    _query(query);
    logger.logInfo('Searched for $query');
    pagingController.refresh();
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }
}
