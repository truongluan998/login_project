import 'package:login_project/models/user.dart';
import 'package:login_project/repository/db_repository.dart';
import '../dependencies/app_dependencies.dart';

class DBBusiness {
  final _dbService = AppDependencies.getIt.get<DBRepository>();

  Future<void> newUser(User user) async => await _dbService.newUser(user);

  Future<User?> getUser() async => await _dbService.getUser();
}
