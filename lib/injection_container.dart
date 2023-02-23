import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:innoscripta/screens/login/data/datasource/login_remote_datasource.dart';
import 'package:innoscripta/screens/login/data/repository/login_repository_impl.dart';
import 'package:innoscripta/screens/login/domain/repository/login_repository.dart';
import 'package:innoscripta/screens/login/domain/usecase/login.dart';
import 'package:innoscripta/screens/sign_up/data/datasource/signup_remote_datasource.dart';
import 'package:innoscripta/screens/sign_up/data/repository/signup_repository_impl.dart';
import 'package:innoscripta/screens/sign_up/domain/repository/signup_repository.dart';
import 'package:innoscripta/screens/sign_up/domain/usecase/create_user.dart';

GetIt locator = GetIt.instance;

Future<void> init() async {
  /// **************** Firebase ******************
  locator.registerLazySingleton(() => FirebaseAuth.instance);

  /// **************** sign-up ******************
  locator.registerLazySingleton<SignupRemoteDatasource>(
      () => SignupRemoteDatasourceImpl(firebaseAuth: locator()));
  locator.registerLazySingleton<SignupRepository>(
      () => SignupRepositoryImpl(remoteDatasource: locator()));
  locator.registerLazySingleton(() => Signup(signupRepository: locator()));
  // *************************************************

  /// **************** Login ******************
  locator.registerLazySingleton<LoginRemoteDatasource>(
      () => LoginRemoteDatasourceImpl(locator()));
  locator.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(remoteDatasource: locator()));
  locator.registerLazySingleton(() => Login(loginRepository: locator()));
  // *************************************************
}
