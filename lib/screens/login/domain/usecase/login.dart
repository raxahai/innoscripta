import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:innoscripta/core/failure/failure.dart';
import 'package:innoscripta/screens/login/domain/repository/login_repository.dart';

class Login {
  final LoginRepository loginRepository;

  const Login({required this.loginRepository});

  Future<Either<Failure, UserCredential>> call(
      String email, String password) async {
    return await loginRepository.login(email, password);
  }
}
