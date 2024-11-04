import 'package:task_manager/domain/entities/category.dart';
import 'package:task_manager/domain/repositories/category_repository.dart';

class FetchCategoriesUsecase {
  final CategoryRepository categoryRepository;

  FetchCategoriesUsecase({required this.categoryRepository});

  Future<List<Category>> execute() async {
    return categoryRepository.getCategories();
  }
}
