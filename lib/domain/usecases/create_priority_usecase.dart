import 'package:task_manager/domain/entities/priority.dart';
import 'package:task_manager/domain/repositories/priority_repository.dart';

class CreatePriorityUsecase {
  final PriorityRepository priorityRepository;

  CreatePriorityUsecase({required this.priorityRepository});

  Future<int> call(Priority priority) {
    return priorityRepository.createPriority(priority);
  }
}
