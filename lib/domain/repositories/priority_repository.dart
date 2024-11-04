import 'package:task_manager/domain/entities/priority.dart';

abstract class PriorityRepository {
  Future<List<Priority>> getPriorities();
  Future<int> createPriority(Priority priority);
  Future<void> updatePriority(Priority priority);
  Future<void> deletePriority(int priorityId);
}
