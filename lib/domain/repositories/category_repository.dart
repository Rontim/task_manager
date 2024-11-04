import 'package:task_manager/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getCategories();
  Future<int> createCategory(Category category);
  Future<void> updateCategory(Category category);
  Future<void> deleteCategory(int categoryId);
}
