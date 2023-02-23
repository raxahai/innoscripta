import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:innoscripta/core/failure/failure.dart';
import 'package:innoscripta/screens/sign_up/domain/repository/signup_repository.dart';

class Signup {
  final SignupRepository signupRepository;

  const Signup({required this.signupRepository});

  Future<Either<Failure, UserCredential>> call(
      String email, String password) async {
    return await signupRepository.createUser(email, password);
  }
}
