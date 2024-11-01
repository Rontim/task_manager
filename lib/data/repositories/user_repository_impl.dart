import 'package:task_manager/data/datasources/local/user_local_data_source.dart';
import 'package:task_manager/data/models/user_model.dart';
import 'package:task_manager/domain/entities/user.dart';
import 'package:task_manager/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource userLocalDataSource;

  UserRepositoryImpl(this.userLocalDataSource);

  @override
  Future<User?> getUser(int id) async {
    final userModel = await userLocalDataSource.getUser(id);

    return User(
      id: userModel!.id,
      name: userModel.name,
      email: userModel.email,
      updatedAt: userModel.updatedAt,
    );
  }

  @override
  Future<void> saveUser(User user) async {
    final userModel = UserModel(
      id: user.id,
      email: user.email,
      name: user.name,
      updatedAt: user.updatedAt,
    );

    await userLocalDataSource.createUser(userModel);
  }

  @override
  Future<void> updateUser(User user) async {
    final userModel = UserModel(
      id: user.id,
      email: user.email,
      name: user.name,
      updatedAt: user.updatedAt,
    );

    await userLocalDataSource.updateUser(userModel);
  }
}