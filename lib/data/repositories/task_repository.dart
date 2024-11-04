import 'package:task_manager/data/datasources/local/task_local_data_source.dart';
import 'package:task_manager/data/models/tasks_model.dart';
import 'package:task_manager/domain/entities/task.dart';
import 'package:task_manager/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource taskLocalDataSource;

  TaskRepositoryImpl(this.taskLocalDataSource);

  @override
  Future<int> createTask(Task task) async {
    final taskModel = TaskModel(
      categoryId: task.categoryId,
      priorityId: task.priorityId,
      userId: task.userId,
      title: task.title,
      description: task.description,
      completed: task.completed,
      updatedAt: task.updatedAt,
    );

    return await taskLocalDataSource.createTask(taskModel);
  }

  @override
  Future<void> deleteTask(int taskId) async {
    await taskLocalDataSource.deleteTask(taskId);
  }

  @override
  Future<Task?> getTaskById(int taskId) async {
    final taskModel = await taskLocalDataSource.getTaskById(taskId);

    if (taskModel != null) {
      return Task(
        id: taskModel.id,
        title: taskModel.title,
        description: taskModel.description,
        completed: taskModel.completed,
        updatedAt: taskModel.updatedAt,
        userId: taskModel.userId,
        categoryId: taskModel.categoryId,
        priorityId: taskModel.priorityId,
      );
    } else {
      return null;
    }
  }

  @override
  Future<List<Task>> getTasks(int pageKey, int pageSize, String? query) async {
    final taskModels =
        await taskLocalDataSource.getAllTasks(pageKey, pageSize, query);

    return taskModels
        .map((task) => Task(
              id: task.id,
              title: task.title,
              description: task.description,
              completed: task.completed,
              updatedAt: task.updatedAt,
              userId: task.userId,
              categoryId: task.categoryId,
              priorityId: task.priorityId,
            ))
        .toList();
  }

  @override
  Future<void> updateTask(Task task) async {
    final taskModel = TaskModel(
      categoryId: task.categoryId,
      priorityId: task.priorityId,
      userId: task.userId,
      title: task.title,
      description: task.description,
      completed: task.completed,
      id: task.id,
      updatedAt: task.updatedAt,
    );

    await taskLocalDataSource.updateTask(taskModel);
  }
}
