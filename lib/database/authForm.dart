import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoginPage = true;
  @override
  submitForm() async {
    final auth = FirebaseAuth.instance;
    UserCredential authResult;
    if (isLoginPage) {
      authResult = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      return;
    }
    authResult = await auth.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    String uid = authResult.user!.uid;
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'email': emailController.text,
      'username': usernameController.text,
    });
  }

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        height: height,
        width: width,
        child: Form(
          key: formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.network(
              'https://res.cloudinary.com/nitishk72/image/upload/v1586796259/nstack_in/courses/flutter/flutter-banner.png',
            ),
            if (!isLoginPage)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: const Text('Username'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Field is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: const Text('Email'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Field is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: const Text('Password'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff252c4a)),
                onPressed: () {
                  submitForm();
                },
                child:
                    isLoginPage ? const Text('Login') : const Text('Sign up'),
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    isLoginPage = !isLoginPage;
                  });
                },
                child: isLoginPage
                    ? const Text("Don't have an account? Sign up")
                    : const Text('Already a member'))
          ]),
        ),
      ),
    );
  }
}
