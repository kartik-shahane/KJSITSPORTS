import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:fluttertoast/fluttertoast.dart';

class Utils{



  void toastMessage(String message){
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}