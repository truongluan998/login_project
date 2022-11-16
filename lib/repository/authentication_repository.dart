import 'package:login_project/models/user.dart';

abstract class AuthenticationRepository {
  Future<User?> loginUser(String? email, String? password);
  Future<bool> checkUser(User? user);
}