import 'package:task_manager/app_injector.dart';
import 'package:task_manager/core/constants/db_constants.dart';
import 'package:task_manager/core/logger_service.dart';
import 'package:task_manager/data/datasources/local/db_service.dart';
import 'package:task_manager/data/models/tasks_model.dart';

class TaskLocalDataSource {
  final DBService dbService;

  final logger = locator<LoggerService>();

  TaskLocalDataSource(this.dbService);

  Future<int> createTask(TaskModel task) async {
    final db = await dbService.database;
    return await db.insert(DBConstants.taskTable, task.toMap());
  }

  Future<List<TaskModel>> getAllTasks(
      int offset, int limit, String? query) async {
    final db = await dbService.database;
    late List<Map<String, Object?>> maps;

    if (query!.isNotEmpty) {
      maps = await db.query(DBConstants.taskTable,
          limit: limit,
          offset: offset,
          where: '${DBConstants.taskTitle} = ?',
          whereArgs: [query]);
    } else {
      maps = await db.query(
        DBConstants.taskTable,
        limit: limit,
        offset: offset,
      );
    }

    if (maps.isEmpty) {
      return [];
    }

    logger.logDebug(maps.toString());

    return maps.map((task) => TaskModel.fromMap(task)).toList();
  }

  Future<TaskModel?> getTaskById(int taskId) async {
    final db = await dbService.database;
    final maps = await db.query(DBConstants.taskTable,
        where: '${DBConstants.taskId} = ?', whereArgs: [taskId]);

    if (maps.isNotEmpty) {
      return TaskModel.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> updateTask(TaskModel task) async {
    final db = await dbService.database;
    return await db.update(DBConstants.taskTable, task.toMap(),
        where: '${DBConstants.taskId} = ?', whereArgs: [task.id]);
  }

  Future<int> deleteTask(int id) async {
    final db = await dbService.database;
    return await db.delete(DBConstants.taskTable,
        where: '${DBConstants.taskId} = ?', whereArgs: [id]);
  }
}
