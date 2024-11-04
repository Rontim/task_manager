import 'package:task_manager/domain/entities/user.dart';
import 'package:task_manager/domain/repositories/user_repository.dart';

class FetchUserUsecase {
  final UserRepository userRepository;

  FetchUserUsecase({required this.userRepository});

  Future<User?> call() async {
    return await userRepository.getUser();
  }
}
