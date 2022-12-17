import 'package:flutter/material.dart';
import 'package:todo_app/database/authForm.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Todo App'),
      ),
      body: AuthForm(),
    );
  }
}
