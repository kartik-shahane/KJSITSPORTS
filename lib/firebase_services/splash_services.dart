// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:async';
// ignore: avoid_web_libraries_in_flutter

import 'package:fire_auth/UI/auth/posts/post_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fire_auth/UI/auth/posts/add_posts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fire_auth/UI/auth/login_screen.dart';
import 'package:fire_auth/main.dart';


class SplashServices {
  void islogin(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if (user != null) {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => PostScreen()
              )));
    } else {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen())));
    }
  }
}
