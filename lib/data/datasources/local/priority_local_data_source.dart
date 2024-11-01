import 'package:task_manager/core/constants/db_constants.dart';
import 'package:task_manager/data/datasources/local/db_service.dart';
import 'package:task_manager/data/models/priority_model.dart';

class PriorityLocalDataSource {
  final DBService dbService;

  PriorityLocalDataSource(this.dbService);

  Future<int> createPriority(PriorityModel priority) async {
    final db = await dbService.database;
    return await db.insert(DBConstants.priorityTable, priority.toMap());
  }

  Future<List<PriorityModel>> getAllPriorities() async {
    final db = await dbService.database;
    final maps = await db.query(DBConstants.priorityTable);
    return maps.map((priority) => PriorityModel.fromMap(priority)).toList();
  }

  Future<int> updatePriority(PriorityModel priority) async {
    final db = await dbService.database;
    return await db.update(DBConstants.priorityTable, priority.toMap(),
        where: '${DBConstants.priorityId} = ?', whereArgs: [priority.id]);
  }

  Future<int> deletePriority(int id) async {
    final db = await dbService.database;
    return await db.delete(DBConstants.priorityTable,
        where: '${DBConstants.priorityId} = ?', whereArgs: [id]);
  }
}
