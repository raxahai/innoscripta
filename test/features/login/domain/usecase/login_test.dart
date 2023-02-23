import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innoscripta/screens/login/domain/repository/login_repository.dart';
import 'package:innoscripta/screens/login/domain/usecase/login.dart';
import 'package:mocktail/mocktail.dart';
import 'package:firebase_auth_mocks/src/mock_user_credential.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

void main() {
  late MockLoginRepository mockLoginRepository;
  late Login login;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    login = Login(loginRepository: mockLoginRepository);
  });

  String email = "dummy@test.com";
  String password = "123456789Hh@";

  test("should login with username and password", () async {
    // arrange
    when(() => mockLoginRepository.login(email, password))
        .thenAnswer((invocation) async => Right(MockUserCredential(true)));

    // act
    await login(email, password);

    // assert
    verify(() => mockLoginRepository.login(email, password)).called(1);
  });
}
