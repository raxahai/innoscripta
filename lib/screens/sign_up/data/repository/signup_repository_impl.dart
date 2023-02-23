import 'package:firebase_auth/firebase_auth.dart';
import 'package:innoscripta/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:innoscripta/core/failure/firebase_auth_failure.dart';
import 'package:innoscripta/screens/sign_up/data/datasource/signup_remote_datasource.dart';
import 'package:innoscripta/screens/sign_up/domain/repository/signup_repository.dart';

class SignupRepositoryImpl implements SignupRepository {
  final SignupRemoteDatasource remoteDatasource;

  const SignupRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, UserCredential>> createUser(
      String email, String password) async {
    try {
      return Right(await remoteDatasource.createUser(email, password));
    } on FirebaseAuthException {
      return Left(FirebaseAuthFailure());
    }
  }
}
