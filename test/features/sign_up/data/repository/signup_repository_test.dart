import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innoscripta/core/failure/firebase_auth_failure.dart';
import 'package:innoscripta/screens/sign_up/data/datasource/signup_remote_datasource.dart';
import 'package:innoscripta/screens/sign_up/data/repository/signup_repository_impl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:firebase_auth_mocks/src/mock_user_credential.dart';

class MockSignupRemoteDatasource extends Mock
    implements SignupRemoteDatasource {}

void main() {
  late MockSignupRemoteDatasource mockSignupRemoteDatasource;
  late SignupRepositoryImpl signupRepositoryImpl;

  setUp(() {
    mockSignupRemoteDatasource = MockSignupRemoteDatasource();
    signupRepositoryImpl =
        SignupRepositoryImpl(remoteDatasource: mockSignupRemoteDatasource);
  });

  String email = "dummy@test.com";
  String password = "123456789Hh@";

  test("should return user-credentials on successful execution", () async {
    // arrange
    when(() => mockSignupRemoteDatasource.createUser(email, password))
        .thenAnswer((_) async => MockUserCredential(true));

    // act
    await signupRepositoryImpl.createUser(email, password);

    // assert
    verify(() => mockSignupRemoteDatasource.createUser(email, password))
        .called(1);
  });

  test("should return firebase auth failure when unsuccesful", () async {
    // arrange
    when(() => mockSignupRemoteDatasource.createUser(email, password))
        .thenThrow(FirebaseAuthException(code: "500"));

    // act
    final result = await signupRepositoryImpl.createUser(email, password);

    // assert
    verify(() => mockSignupRemoteDatasource.createUser(email, password))
        .called(1);
    expect(result, Left(FirebaseAuthFailure()));
  });
}
