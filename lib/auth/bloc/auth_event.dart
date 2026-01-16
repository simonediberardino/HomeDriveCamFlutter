import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthEvent {}

class CheckAuthStatus extends AuthEvent {}

class SignInWithGoogle extends AuthEvent {}

class SignOut extends AuthEvent {}
