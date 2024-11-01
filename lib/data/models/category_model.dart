import 'package:task_manager/core/constants/db_constants.dart';
import 'package:task_manager/domain/entities/category.dart';

class CategoryModel {
  final int id;
  final String name;

  CategoryModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      DBConstants.categoryId: id,
      DBConstants.categoryName: name,
    };
  }

  static CategoryModel fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map[DBConstants.categoryId],
      name: map[DBConstants.categoryName],
    );
  }

  static CategoryModel fromEntity(Category category) {
    return CategoryModel(
      id: category.id,
      name: category.name,
    );
  }
}
