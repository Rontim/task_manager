import 'package:task_manager/domain/entities/task.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks(int pageKey, int pageSize, String? query);
  Future<int> createTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(int taskId);
  Future<Task?> getTaskById(int taskId);
}
