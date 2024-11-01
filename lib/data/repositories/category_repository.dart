import 'package:task_manager/data/datasources/local/category_local_data_source.dart';
import 'package:task_manager/data/models/category_model.dart';
import 'package:task_manager/domain/entities/category.dart';
import 'package:task_manager/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryLocalDataSource categoryLocalDataSource;

  CategoryRepositoryImpl(this.categoryLocalDataSource);

  @override
  Future<void> createCategory(Category category) async {
    final categoryModel = CategoryModel.fromEntity(category);
    await categoryLocalDataSource.createCategory(categoryModel);
  }

  @override
  Future<void> deleteCategory(int categoryId) async {
    await categoryLocalDataSource.deleteCategory(categoryId);
  }

  @override
  Future<List<Category>> getCategories() async {
    final categories = await categoryLocalDataSource.getAllCategories();

    return categories
        .map((category) => Category(id: category.id, name: category.name))
        .toList();
  }

  @override
  Future<void> updateCategory(Category category) async {
    final categoryModel = CategoryModel.fromEntity(category);
    await categoryLocalDataSource.updateCategory(categoryModel);
  }
}
