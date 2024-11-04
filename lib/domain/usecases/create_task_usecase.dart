import 'package:task_manager/domain/entities/task.dart';
import 'package:task_manager/domain/repositories/task_repository.dart';

class CreateTaskUsecase {
  final TaskRepository taskRepository;

  CreateTaskUsecase({required this.taskRepository});

  Future<int> call(Task task) async {
    return await taskRepository.createTask(task);
  }
}
