part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthState {
  final String authId;

  Authenticated({required this.authId});

  @override
  List<Object?> get props => [];
}

class AuthenticationRequired extends AuthState {

  @override
  List<Object?> get props => [];
}
