// ignore_for_file: prefer_const_constructors

// ignore: unused_import
import 'package:fire_auth/UI/auth/login_screen.dart';
import 'package:fire_auth/firebase_services/splash_services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();
 

  //@override
  @override
  void initState() {
    super.initState();
    splashScreen.islogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Hello KJSITians',style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
