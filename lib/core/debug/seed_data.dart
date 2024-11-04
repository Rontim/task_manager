import 'package:task_manager/app_injector.dart';
import 'package:task_manager/core/constants/db_constants.dart';
import 'package:task_manager/core/constants/dummy_data.dart';
import 'package:task_manager/core/logger_service.dart';
import 'package:task_manager/data/datasources/local/db_service.dart';

class WipeDatabase {
  final DBService dbService;
  final logger = locator<LoggerService>();

  WipeDatabase(this.dbService);

  Future<void> wipe() async {
    final db = await dbService.database;

    await db.execute('DROP TABLE IF EXISTS ${DBConstants.userTable}');
    await db.execute('DROP TABLE IF EXISTS ${DBConstants.categoryTable}');
    await db.execute('DROP TABLE IF EXISTS ${DBConstants.priorityTable}');
    await db.execute('DROP TABLE IF EXISTS ${DBConstants.taskTable}');
    await db.execute('DROP TABLE IF EXISTS ${DBConstants.notificationTable}');

    logger.logInfo('Database wiped');

    await db.execute(DBConstants.createUserTable);
    await db.execute(DBConstants.createCategoryTable);
    await db.execute(DBConstants.createPriorityTable);
    await db.execute(DBConstants.createTaskTable);
    await db.execute(DBConstants.createNotificationTable);

    // await dbService.database;
  }
}

class SeedData {
  final DBService dbService;

  SeedData(this.dbService);

  Future<void> insertDummyData() async {
    final db = await dbService.database;
    // Insert Dummy User
    await db.insert(DBConstants.userTable, {
      DBConstants.userName: 'Ron Gitonga',
      DBConstants.userEmail: 'rongitonga@gmail.com',
      DBConstants.userUpdatedAt: DateTime.now().toIso8601String(),
    });

    // Insert Dummy Category
    final categories = ['Work', 'Personal', 'Family', 'Fitness'];
    for (var category in categories) {
      await db.insert(DBConstants.categoryTable, {
        DBConstants.categoryName: category,
      });
    }

    // Insert Dummy Priority
    final priorities = ['High', 'Medium', 'Low'];
    for (var priority in priorities) {
      await db.insert(DBConstants.priorityTable, {
        DBConstants.priorityName: priority,
      });
    }

    // Insert Dummy Task
    final dummyTasks = tasks;
    for (var task in dummyTasks) {
      await db.insert(DBConstants.taskTable, {
        DBConstants.taskId: task['id'],
        DBConstants.taskTitle: task['title'],
        DBConstants.taskDescription: task['description'],
        DBConstants.taskCategoryId: task['category'],
        DBConstants.taskPriorityId: task['priority'],
        DBConstants.taskUserId: 1,
        DBConstants.taskCompleted: task['completed'],
        DBConstants.taskUpdatedAt: DateTime.now().toIso8601String(),
      });
    }
  }
}
