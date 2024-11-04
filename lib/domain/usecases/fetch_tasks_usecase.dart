import 'package:task_manager/domain/entities/task.dart';
import 'package:task_manager/domain/repositories/task_repository.dart';

class FetchTasksUseCase {
  final TaskRepository taskRepository;

  FetchTasksUseCase({required this.taskRepository});

  Future<List<Task>> call(int pageKey, int pageSize, String? query) {
    return taskRepository.getTasks(pageKey, pageSize, query);
  }
}
