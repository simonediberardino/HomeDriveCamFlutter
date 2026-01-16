import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:homedrivecam/auth/bloc/auth_bloc.dart';
import 'package:homedrivecam/auth/bloc/auth_event.dart';

class WelcomePage extends StatelessWidget {
  final GoogleSignInAccount user;

  const WelcomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(SignOut());
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${user.displayName}!'),
            const SizedBox(height: 16),
            Text('Email: ${user.email}'),
          ],
        ),
      ),
    );
  }
}
