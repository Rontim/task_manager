import 'package:get/get.dart';
import 'package:task_manager/app_injector.dart';
import 'package:task_manager/core/logger_service.dart';
import 'package:task_manager/domain/entities/category.dart';
import 'package:task_manager/domain/entities/priority.dart';
import 'package:task_manager/domain/entities/task.dart';
import 'package:task_manager/domain/usecases/create_category_usecase.dart';
import 'package:task_manager/domain/usecases/create_task_usecase.dart';
import 'package:task_manager/domain/usecases/fetch_categories_usecase.dart';
import 'package:task_manager/domain/usecases/fetch_priorities_usecase.dart';
import 'package:task_manager/domain/usecases/fetch_user_usecase.dart';
import 'package:task_manager/main_navigation.dart';
import 'package:task_manager/presentation/controllers/task_controller.dart';

class CreateTaskController extends GetxController {
  final TaskController taskController = Get.find<TaskController>();
  final MainNavigationController mainNavigationController =
      Get.find<MainNavigationController>();

  final userId = 0.obs;
  final categories = <Category>[].obs;
  final selectedCategory = Category(id: 0, name: '').obs;
  final priorites = <Priority>[].obs;
  final selectedPriority = Priority(id: 0, name: '').obs;

  final logger = locator<LoggerService>();

  final FetchUserUsecase fetchUserUsecase = locator<FetchUserUsecase>();
  final FetchCategoriesUsecase fetchCategoriesUsecase =
      locator<FetchCategoriesUsecase>();
  final FetchPrioritiesUsecase fetchPrioritiesUseCase =
      locator<FetchPrioritiesUsecase>();
  final CreateCategoryUsecase createCategoryUsecase =
      locator<CreateCategoryUsecase>();
  final CreateTaskUsecase createTaskUsecase = locator<CreateTaskUsecase>();

  @override
  void onInit() async {
    super.onInit();
    fetchUser();
    fetchCategories();
    fetchPriorities();
  }

  void selectCategory(Category category) {
    selectedCategory.value = category;
  }

  void selectPriority(Priority priority) {
    selectedPriority.value = priority;
  }

  Future<void> fetchUser() async {
    try {
      final user = await fetchUserUsecase.call();
      userId.value = user!.id;
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch user');
      logger.logError(e.toString());
    }
  }

  Future<void> fetchCategories() async {
    categories.value = await fetchCategoriesUsecase.execute();

    if (categories.isEmpty) {
      Get.snackbar('Error', 'Failed to fetch categories, create one first');
    }
  }

  Future<void> fetchPriorities() async {
    priorites.value = await fetchPrioritiesUseCase.call();

    if (priorites.isEmpty) {
      Get.snackbar('Error', 'Failed to fetch priorities, create one first');
    }
  }

  Future<void> createNewCategory(Category category) async {
    selectedCategory.value =
        (await createCategoryUsecase.call(category)) as Category;
    fetchCategories();
  }

  Future<void> createTask(Task task) async {
    try {
      await createTaskUsecase.call(task);
      Get.snackbar('Success', 'Task created successfully');
      taskController.pagingController.refresh();
      mainNavigationController.changePage(1);
    } catch (e) {
      Get.snackbar('Error', 'Failed to create task');
    }
  }
}
