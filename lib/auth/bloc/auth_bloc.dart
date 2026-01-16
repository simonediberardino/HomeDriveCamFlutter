
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthBloc() : super(AuthInitial()) {
    on<CheckAuthStatus>((event, emit) async {
      log('Checking auth status...');
      try {
        final currentUser = await _googleSignIn.signInSilently();
        if (currentUser != null) {
          log('User is already signed in: ${currentUser.email}');
          emit(Authenticated(currentUser));
        } else {
          log('User is not signed in.');
          emit(Unauthenticated());
        }
      } catch (error) {
        log('Error during silent sign in: $error');
        emit(Unauthenticated());
      }
    });

    on<SignInWithGoogle>((event, emit) async {
      log('Attempting to sign in with Google...');
      try {
        final googleUser = await _googleSignIn.signIn();
        if (googleUser != null) {
          log('Successfully signed in with Google: ${googleUser.email}');
          emit(Authenticated(googleUser));
        } else {
          log('Google sign in was cancelled by the user.');
          emit(Unauthenticated());
        }
      } catch (error) {
        log('Error during Google sign in: $error');
        emit(AuthError(error.toString()));
      }
    });

    on<SignOut>((event, emit) async {
      log('Signing out...');
      await _googleSignIn.signOut();
      log('User signed out.');
      emit(Unauthenticated());
    });
  }
}
