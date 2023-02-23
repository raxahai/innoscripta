import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innoscripta/screens/login/data/datasource/login_remote_datasource.dart';

void main() {
  late LoginRemoteDatasourceImpl remoteDatasource;

  setUp(() {
    // arrange mock
    remoteDatasource = LoginRemoteDatasourceImpl(
        MockFirebaseAuth(mockUser: MockUser(uid: "dummy")));
  });

  String email = "dummy@test.com";
  String password = "123456789Hh@";

  test("should login a user using firebase as datasource", () async {
    // act
    final result = await remoteDatasource.login(email, password);

    // assert
    expect(result.user?.uid, "dummy");
  });
}
