import 'package:task_manager/domain/entities/user.dart';

abstract class UserRepository {
  Future<User?> getUser();
  Future<void> saveUser(User user);
  Future<void> updateUser(User user);
}
