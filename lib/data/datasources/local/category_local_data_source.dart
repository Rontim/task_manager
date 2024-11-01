import 'package:task_manager/core/constants/db_constants.dart';
import 'package:task_manager/data/datasources/local/db_service.dart';
import 'package:task_manager/data/models/category_model.dart';

class CategoryLocalDataSource {
  final DBService dbService;

  CategoryLocalDataSource(this.dbService);

  Future<int> createCategory(CategoryModel category) async {
    final db = await dbService.database;
    return await db.insert(DBConstants.categoryTable, category.toMap());
  }

  Future<List<CategoryModel>> getAllCategories() async {
    final db = await dbService.database;
    final maps = await db.query(DBConstants.categoryTable);
    return maps.map((category) => CategoryModel.fromMap(category)).toList();
  }

  Future<int> updateCategory(CategoryModel category) async {
    final db = await dbService.database;
    return await db.update(DBConstants.categoryTable, category.toMap(),
        where: '${DBConstants.categoryId} = ?', whereArgs: [category.id]);
  }

  Future<int> deleteCategory(int id) async {
    final db = await dbService.database;
    return await db.delete(DBConstants.categoryTable,
        where: '${DBConstants.categoryId} = ?', whereArgs: [id]);
  }
}
