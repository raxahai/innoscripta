import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innoscripta/screens/sign_up/domain/repository/signup_repository.dart';
import 'package:innoscripta/screens/sign_up/domain/usecase/create_user.dart';
import 'package:mocktail/mocktail.dart';
import 'package:firebase_auth_mocks/src/mock_user_credential.dart';

class MockSignupRepository extends Mock implements SignupRepository {}

void main() {
  late MockSignupRepository mockSignupRepository;
  late Signup signup;

  setUpAll(() {
    mockSignupRepository = MockSignupRepository();
    signup = Signup(signupRepository: mockSignupRepository);
  });

  String email = "dummy@test.com";
  String password = "123456789Hh@";

  test("should create a new user", () async {
    // arrange
    when(() => mockSignupRepository.createUser(email, password))
        .thenAnswer((_) async => Right(MockUserCredential(true)));

    // act
    await signup(email, password);

    // assert
    verify(() => mockSignupRepository.createUser(email, password)).called(1);
  });
}
