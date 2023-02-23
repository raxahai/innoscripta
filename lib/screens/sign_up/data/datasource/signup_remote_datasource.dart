import 'package:firebase_auth/firebase_auth.dart';

abstract class SignupRemoteDatasource {
  Future<UserCredential> createUser(String email, String password);
}

class SignupRemoteDatasourceImpl implements SignupRemoteDatasource {
  final FirebaseAuth firebaseAuth;

  SignupRemoteDatasourceImpl({required this.firebaseAuth});

  @override
  Future<UserCredential> createUser(String email, String password) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
