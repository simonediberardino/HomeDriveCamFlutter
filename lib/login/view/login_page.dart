import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homedrivecam/auth/bloc/auth_bloc.dart';
import 'package:homedrivecam/auth/bloc/auth_event.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            BlocProvider.of<AuthBloc>(context).add(SignInWithGoogle());
          },
          child: const Text('Sign in with Google'),
        ),
      ),
    );
  }
}
