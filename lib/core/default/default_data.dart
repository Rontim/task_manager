import 'package:task_manager/core/constants/db_constants.dart';
import 'package:task_manager/data/datasources/local/db_service.dart';

class DefaultData {
  final DBService _dbService;

  DefaultData(this._dbService);

  Future<void> insertDefaultData() async {
    final db = await _dbService.database;

    // Insert Default User
    await db.insert(DBConstants.userTable, {
      DBConstants.userName: 'Ron Gitonga',
      DBConstants.userEmail: 'rongitonga@gmail.com',
      DBConstants.userUpdatedAt: DateTime.now().toIso8601String(),
    });

    // Insert Default Categories
    final categories = ['Work', 'Personal', 'Family', 'Fitness'];
    for (var category in categories) {
      await db.insert(DBConstants.categoryTable, {
        DBConstants.categoryName: category,
      });
    }

    // Insert Default Priorities
    final priorities = ['High', 'Medium', 'Low'];
    for (var priority in priorities) {
      await db.insert(DBConstants.priorityTable, {
        DBConstants.priorityName: priority,
      });
    }
  }
}
