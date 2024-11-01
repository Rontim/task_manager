import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:task_manager/core/constants/db_constants.dart';

class DBService {
  static final DBService instance = DBService._internal();

  factory DBService() {
    return instance;
  }

  DBService._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), DBConstants.databaseName);

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(DBConstants.createUserTable);
    await db.execute(DBConstants.createCategoryTable);
    await db.execute(DBConstants.createPriorityTable);
    await db.execute(DBConstants.createTaskTable);
    await db.execute(DBConstants.createNotificationTable);
  }

  Future<void> close() async {
    final db = await instance.database;
    db.close();
  }

  Future<void> deleteDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'task_manager.db');
    await deleteDatabase(path);
  }
}
