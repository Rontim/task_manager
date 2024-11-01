import 'package:task_manager/core/constants/db_constants.dart';
import 'package:task_manager/domain/entities/priority.dart';

class PriorityModel {
  final int id;
  final String name;

  PriorityModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      DBConstants.priorityId: id,
      DBConstants.priorityName: name,
    };
  }

  static PriorityModel fromMap(Map<String, dynamic> map) {
    return PriorityModel(
      id: map[DBConstants.priorityId],
      name: map[DBConstants.priorityName],
    );
  }

  static PriorityModel fromEntity(Priority priority) {
    return PriorityModel(
      id: priority.id,
      name: priority.name,
    );
  }
}
