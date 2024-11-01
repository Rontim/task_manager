import 'package:task_manager/domain/entities/task.dart';
import 'package:task_manager/domain/repositories/task_repository.dart';

class FetchAllTasksUseCase {
  final TaskRepository taskRepository;

  FetchAllTasksUseCase({required this.taskRepository});

  Future<List<Task>> call(int pageKey, int pageSize) {
    return taskRepository.getTasks(pageKey, pageSize);
  }
}
