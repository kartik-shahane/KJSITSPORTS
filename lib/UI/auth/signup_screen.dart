// ignore_for_file: prefer_const_literals_to_create_immutables

//import 'dart:html';

import 'package:fire_auth/UI/auth/login_screen.dart';
// ignore: unused_import
import 'package:fire_auth/utils/utils.dart';
import 'package:fire_auth/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  // ignore: non_constant_identifier_names
  final PasswordController = TextEditingController();

  // ignore: prefer_final_fields
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    PasswordController.dispose();
  }

// ignore: non_constant_identifier_names
  void SignUp() {
     setState(() {
                      loading = true;
                    });

                    _auth
                        .createUserWithEmailAndPassword(
                            email: emailController.text.toString(),
                            password: PasswordController.text.toString())
                        .then((value) {
                          setState(() {
                      loading = false;
                    });
                        })
                        .onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                      setState(() {
                      loading = false;
                    });
                    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: const InputDecoration(
                        hintText: 'Email',
                        helperText: 'enter email e.g jon@gmail.com',
                        prefixIcon: Icon(Icons.alternate_email)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter email';
                      }
                      return null;
                    },
                  ),
                  // ignore: prefer_const_constructors
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: PasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock_open)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter password';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            // ignore: prefer_const_constructors
            const SizedBox(
              height: 50,
            ),
            RoundButton(
              title: 'Signup',
              loading: loading,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                
                  SignUp();
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: const Text('login'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
