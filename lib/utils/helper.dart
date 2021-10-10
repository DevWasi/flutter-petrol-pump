import 'package:flutter/material.dart';

void nextScreen(BuildContext context, String route) {
  Navigator.of(context).pushNamed(route);
}

//// caps the first letter of sting
String capitalize(String s) => s[0].toUpperCase() + s.substring(1);


/// check if the string contains only numbers
bool isNumeric(String str) {
  RegExp _numeric = RegExp(r'^[0-9]+$');
  return _numeric.hasMatch(str);
}

/// check if the string is a valid email
bool isEmail(String str) {
  RegExp _email = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return _email.hasMatch(str);
}