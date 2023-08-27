import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toastMsg(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black54,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      textColor: Colors.white,
      fontSize: 18,
      timeInSecForIosWeb: 2
  );
}

void toastLoading() {
  Fluttertoast.showToast(
      msg: 'Loading...',
      backgroundColor: Colors.black54,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      textColor: Colors.white,
      fontSize: 18,
      timeInSecForIosWeb: 100
  );
}

void toastCancel() {
  Fluttertoast.cancel();
}