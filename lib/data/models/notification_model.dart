import 'package:task_manager/core/constants/db_constants.dart';

class NotificationModel {
  final int id;
  final String time;
  final int taskId;

  NotificationModel({
    required this.id,
    required this.time,
    required this.taskId,
  });

  Map<String, dynamic> toMap() {
    return {
      DBConstants.notificationId: id,
      DBConstants.notificationTime: time,
      DBConstants.notificationTaskId: taskId,
    };
  }

  static NotificationModel fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map[DBConstants.notificationId],
      time: map[DBConstants.notificationTime],
      taskId: map[DBConstants.notificationTaskId],
    );
  }
}
