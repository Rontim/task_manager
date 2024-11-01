import 'package:task_manager/core/constants/db_constants.dart';
import 'package:task_manager/data/datasources/local/db_service.dart';
import 'package:task_manager/data/models/user_model.dart';

class UserLocalDataSource {
  final DBService _dbService;

  UserLocalDataSource(this._dbService);

  Future<int> createUser(UserModel user) async {
    final db = await _dbService.database;

    return await db.insert(DBConstants.userTable, user.toJson());
  }

  Future<UserModel?> getUser(int id) async {
    final db = await _dbService.database;

    final maps = await db.query(DBConstants.userTable,
        where: '${DBConstants.userId} = ?}', whereArgs: [id]);

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
