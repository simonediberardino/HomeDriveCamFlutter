import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  final GoogleSignInAccount user;

  Authenticated(this.user);
}

class Unauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}
