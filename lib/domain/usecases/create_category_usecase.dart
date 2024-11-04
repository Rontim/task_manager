import 'package:task_manager/domain/entities/category.dart';
import 'package:task_manager/domain/repositories/category_repository.dart';

class CreateCategoryUsecase {
  final CategoryRepository categoryRepository;

  CreateCategoryUsecase({required this.categoryRepository});

  Future<int> call(Category category) async {
    return await categoryRepository.createCategory(category);
  }
}
