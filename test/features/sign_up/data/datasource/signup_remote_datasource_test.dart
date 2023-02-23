import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innoscripta/screens/sign_up/data/datasource/signup_remote_datasource.dart';

void main() {
  late SignupRemoteDatasourceImpl remoteDatasource;

  setUp(() {
    // arrange mock
    remoteDatasource = SignupRemoteDatasourceImpl(
        firebaseAuth: MockFirebaseAuth(mockUser: MockUser()));
  });

  String email = "dummy@test.com";
  String password = "123456789Hh@";

  test("should create a user using firebase as datasource", () async {
    // act
    final result = await remoteDatasource.createUser(email, password);

    // assert
    expect(result.user?.uid, "mock_uid");
  });
}
