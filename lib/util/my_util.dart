import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyUtil {
  static showToast(msg) {
    if (msg != null && msg != "") {
      Fluttertoast.showToast(
          msg: msg,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }
}