import 'package:task_manager/core/constants/db_constants.dart';

class TaskModel {
  final int id;
  final String title;
  final String description;
  final bool completed;
  final String updatedAt;
  final int userId;
  final int categoryId;
  final int priorityId;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.completed,
    required this.updatedAt,
    required this.userId,
    required this.categoryId,
    required this.priorityId,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json[DBConstants.taskId],
      title: json[DBConstants.taskTitle],
      description: json[DBConstants.taskDescription],
      completed: json[DBConstants.taskCompleted] == 1,
      updatedAt: json[DBConstants.taskUpdatedAt],
      userId: json[DBConstants.taskUserId],
      categoryId: json[DBConstants.taskCategoryId],
      priorityId: json[DBConstants.taskPriorityId],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      DBConstants.taskId: id,
      DBConstants.taskTitle: title,
      DBConstants.taskDescription: description,
      DBConstants.taskCompleted: completed ? 1 : 0,
      DBConstants.taskUpdatedAt: updatedAt,
      DBConstants.taskUserId: userId,
      DBConstants.taskCategoryId: categoryId,
      DBConstants.taskPriorityId: priorityId,
    };
  }

  static TaskModel fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map[DBConstants.taskId],
      title: map[DBConstants.taskTitle],
      description: map[DBConstants.taskDescription],
      completed: map[DBConstants.taskCompleted] == 1,
      updatedAt: map[DBConstants.taskUpdatedAt],
      userId: map[DBConstants.taskUserId],
      categoryId: map[DBConstants.taskCategoryId],
      priorityId: map[DBConstants.taskPriorityId],
    );
  }
}
