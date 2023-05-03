// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:async';
import 'package:fire_auth/UI/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fire_auth/main.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[700],
        child: const Center(
            child: Text(
          'KJSIT Sports',
          style: TextStyle(
              fontSize: 35, fontWeight: FontWeight.w500, color: Colors.white),
        )),
      ),
    );
  }
}
