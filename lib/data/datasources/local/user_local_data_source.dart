import 'package:task_manager/app_injector.dart';
import 'package:task_manager/core/constants/db_constants.dart';
import 'package:task_manager/core/logger_service.dart';
import 'package:task_manager/data/datasources/local/db_service.dart';
import 'package:task_manager/data/models/user_model.dart';

class UserLocalDataSource {
  final DBService _dbService;
  final logger = locator<LoggerService>();

  UserLocalDataSource(this._dbService);

  Future<int> createUser(UserModel user) async {
    final db = await _dbService.database;

    return await db.insert(DBConstants.userTable, user.toJson());
  }

  Future<UserModel?> getUser() async {
    final db = await _dbService.database;

    final maps = await db.query(DBConstants.userTable, limit: 1);

    logger.logInfo(maps.toString());

    if (maps.isNotEmpty) {
      return UserModel.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> updateUser(UserModel user) async {
    final db = await _dbService.database;

    return await db.update(DBConstants.userTable, user.toJson(),
        where: '${DBConstants.userId} = ?', whereArgs: [user.id]);
  }
}
