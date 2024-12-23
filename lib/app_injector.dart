import 'package:get_it/get_it.dart';
import 'package:task_manager/core/logger_service.dart';
import 'package:task_manager/core/network_info.dart';
import 'package:task_manager/data/datasources/local/category_local_data_source.dart';
import 'package:task_manager/data/datasources/local/db_service.dart';
import 'package:task_manager/data/datasources/local/priority_local_data_source.dart';
import 'package:task_manager/data/datasources/local/task_local_data_source.dart';
import 'package:task_manager/data/datasources/local/user_local_data_source.dart';
import 'package:task_manager/data/repositories/category_repository.dart';
import 'package:task_manager/data/repositories/priority_repository.dart';
import 'package:task_manager/data/repositories/task_repository.dart';
import 'package:task_manager/data/repositories/user_repository_impl.dart';
import 'package:task_manager/domain/repositories/category_repository.dart';
import 'package:task_manager/domain/repositories/priority_repository.dart';
import 'package:task_manager/domain/repositories/task_repository.dart';
import 'package:task_manager/domain/repositories/user_repository.dart';
import 'package:task_manager/domain/usecases/create_category_usecase.dart';
import 'package:task_manager/domain/usecases/create_priority_usecase.dart';
import 'package:task_manager/domain/usecases/create_task_usecase.dart';
import 'package:task_manager/domain/usecases/fetch_categories_usecase.dart';
import 'package:task_manager/domain/usecases/fetch_priorities_usecase.dart';
import 'package:task_manager/domain/usecases/fetch_tasks_usecase.dart';
import 'package:task_manager/domain/usecases/fetch_user_usecase.dart';

final locator = GetIt.instance;

void setUpDependancies() {
  // Register Services
  locator.registerLazySingleton<LoggerService>(() => LoggerService());
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfo());
  locator.registerLazySingleton<DBService>(() => DBService());

  // Register DataSources
  locator.registerLazySingleton<TaskLocalDataSource>(
      () => TaskLocalDataSource(locator<DBService>()));
  locator.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSource(locator<DBService>()));
  locator.registerLazySingleton<CategoryLocalDataSource>(
      () => CategoryLocalDataSource(locator<DBService>()));
  locator.registerLazySingleton<PriorityLocalDataSource>(
      () => PriorityLocalDataSource(locator<DBService>()));

  // Register Repositories
  locator.registerLazySingleton<TaskRepository>(
      () => TaskRepositoryImpl(locator<TaskLocalDataSource>()));
  locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(locator<UserLocalDataSource>()));
  locator.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(locator<CategoryLocalDataSource>()));
  locator.registerLazySingleton<PriorityRepository>(
      () => PriorityRepositoryImpl(locator<PriorityLocalDataSource>()));

  // Register UseCases
  locator.registerLazySingleton<FetchTasksUseCase>(
      () => FetchTasksUseCase(taskRepository: locator<TaskRepository>()));
  locator.registerLazySingleton<FetchUserUsecase>(
      () => FetchUserUsecase(userRepository: locator<UserRepository>()));
  locator.registerLazySingleton<FetchCategoriesUsecase>(() =>
      FetchCategoriesUsecase(
          categoryRepository: locator<CategoryRepository>()));
  locator.registerLazySingleton<FetchPrioritiesUsecase>(() =>
      FetchPrioritiesUsecase(
          priorityRepository: locator<PriorityRepository>()));
  locator.registerLazySingleton<CreateTaskUsecase>(
      () => CreateTaskUsecase(taskRepository: locator<TaskRepository>()));
  locator.registerLazySingleton<CreateCategoryUsecase>(() =>
      CreateCategoryUsecase(categoryRepository: locator<CategoryRepository>()));
  locator.registerLazySingleton<CreatePriorityUsecase>(() =>
      CreatePriorityUsecase(priorityRepository: locator<PriorityRepository>()));
}
