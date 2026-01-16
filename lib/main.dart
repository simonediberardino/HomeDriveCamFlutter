import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homedrivecam/auth/bloc/auth_bloc.dart';
import 'package:homedrivecam/auth/bloc/auth_event.dart';
import 'package:homedrivecam/auth/bloc/auth_state.dart';
import 'package:homedrivecam/home/view/home_page.dart';
import 'package:homedrivecam/login/view/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(CheckAuthStatus()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            log('Current auth state: $state');
            if (state is Authenticated) {
              return WelcomePage(user: state.user);
            } else {
              return const LoginPage();
            }
          },
        ),
      ),
    );
  }
}
