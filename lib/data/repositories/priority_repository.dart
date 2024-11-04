import 'package:task_manager/data/datasources/local/priority_local_data_source.dart';
import 'package:task_manager/data/models/priority_model.dart';
import 'package:task_manager/domain/entities/priority.dart';
import 'package:task_manager/domain/repositories/priority_repository.dart';

class PriorityRepositoryImpl implements PriorityRepository {
  final PriorityLocalDataSource priorityLocalDataSource;

  PriorityRepositoryImpl(this.priorityLocalDataSource);

  @override
  Future<int> createPriority(Priority priority) async {
    return await priorityLocalDataSource
        .createPriority(PriorityModel.fromEntity(priority));
  }

  @override
  Future<void> deletePriority(int priorityId) async {
    await priorityLocalDataSource.deletePriority(priorityId);
  }

  @override
  Future<List<Priority>> getPriorities() async {
    final priorities = await priorityLocalDataSource.getAllPriorities();

    return priorities
        .map((priorityModel) =>
            Priority(id: priorityModel.id, name: priorityModel.name))
        .toList();
  }

  @override
  Future<void> updatePriority(Priority priority) async {
    final priorityModel = PriorityModel.fromEntity(priority);
    await priorityLocalDataSource.updatePriority(priorityModel);
  }
}
