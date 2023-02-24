import 'package:innoscripta/core/failure/failure.dart';

class FirebaseAuthFailure extends Failure {
  const FirebaseAuthFailure(String? message) : super(message);

  @override
  List<Object?> get props => [];
}
