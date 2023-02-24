import 'package:equatable/equatable.dart';

/// Super class for all Failure types,
/// e.g: [FirebaseAuthFailure] for all Firebase auth related exceptions
abstract class Failure extends Equatable {
  final String? message;

  const Failure(this.message);

  String? get getMessage => message;
}
