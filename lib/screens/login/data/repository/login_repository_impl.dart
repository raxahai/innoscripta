import 'package:firebase_auth/firebase_auth.dart';
import 'package:innoscripta/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:innoscripta/core/failure/firebase_auth_failure.dart';
import 'package:innoscripta/screens/login/data/datasource/login_remote_datasource.dart';
import 'package:innoscripta/screens/login/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDatasource remoteDatasource;

  LoginRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, UserCredential>> login(
      String email, String password) async {
    try {
      return Right(await remoteDatasource.login(email, password));
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthFailure(e.message));
    }
  }
}
