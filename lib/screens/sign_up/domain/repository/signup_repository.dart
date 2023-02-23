import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:innoscripta/core/failure/failure.dart';

abstract class SignupRepository {
  Future<Either<Failure, UserCredential>> createUser(
      String email, String password);
}
