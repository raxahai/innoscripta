import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRemoteDatasource {
  Future<UserCredential> login(String email, String password);
}

class LoginRemoteDatasourceImpl implements LoginRemoteDatasource {
  final FirebaseAuth firebaseAuth;

  LoginRemoteDatasourceImpl(this.firebaseAuth);

  @override
  Future<UserCredential> login(String email, String password) {
    return firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }
}
