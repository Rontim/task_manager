import 'package:task_manager/domain/entities/priority.dart';
import 'package:task_manager/domain/repositories/priority_repository.dart';

class FetchPrioritiesUsecase {
  final PriorityRepository priorityRepository;

  FetchPrioritiesUsecase({required this.priorityRepository});

  Future<List<Priority>> call() {
    return priorityRepository.getPriorities();
  }
}
