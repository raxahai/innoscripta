import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innoscripta/core/failure/firebase_auth_failure.dart';
import 'package:innoscripta/screens/login/data/datasource/login_remote_datasource.dart';
import 'package:innoscripta/screens/login/data/repository/login_repository_impl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:firebase_auth_mocks/src/mock_user_credential.dart';

class MockLoginRemoteDatasource extends Mock implements LoginRemoteDatasource {}

void main() {
  late MockLoginRemoteDatasource mockLoginRemoteDatasource;
  late LoginRepositoryImpl loginRepositoryImpl;

  setUp(() {
    mockLoginRemoteDatasource = MockLoginRemoteDatasource();
    loginRepositoryImpl =
        LoginRepositoryImpl(remoteDatasource: mockLoginRemoteDatasource);
  });

  String email = "dummy@test.com";
  String password = "123456789Hh@";

  test("should return user-credentials on successful login", () async {
    // arrange
    when(() => mockLoginRemoteDatasource.login(email, password))
        .thenAnswer((_) async => MockUserCredential(true));

    // act
    await loginRepositoryImpl.login(email, password);

    // assert
    verify(() => mockLoginRemoteDatasource.login(email, password)).called(1);
  });

  test("should return firebase auth failure when unsuccesful", () async {
    // arrange
    when(() => mockLoginRemoteDatasource.login(email, password))
        .thenThrow(FirebaseAuthException(code: "user-not-found"));

    // act
    final result = await loginRepositoryImpl.login(email, password);

    // assert
    verify(() => mockLoginRemoteDatasource.login(email, password)).called(1);
    expect(result, Left(FirebaseAuthFailure()));
  });
}
