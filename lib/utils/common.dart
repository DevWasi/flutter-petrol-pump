import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:h2n_app/utils/manager.dart';
import 'package:h2n_app/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

// getCardFields(context) {
//   List model = getCardModel();
//   List<Widget> fields = <Widget>[];
//   for (var attribute in model) {
//     switch (attribute['name']) {
//       default: fields.add(getCards(attribute, context));
//     }
//   }
//
//   return fields;
// }

appBar(String name, {dynamic leading}) {
  Widget appbar;
  if(name == 'dashboard') {
    appbar = AppBar(
      leading: leading,
      title: Text(
        capitalize(name),
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20.0),
      ),
    );
  } else {
    appbar = AppBar(
      title: Text(
        capitalize(name),
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20.0),
      ),
    );
  }
  return appbar;
}

getCards(attribute, context) {
  return Card(
    color: Colors.green[200],
    margin: attribute['margin'],
    child: InkWell(
      onTap: () {Navigator.pushNamed(context, attribute['route']);},
      splashColor: attribute['splash_color'],
      child: Center(
        child: Column(
          mainAxisSize: attribute['axis_size'],
          children: <Widget>[
            attribute['Icon'],
            Text(attribute['name'], style: attribute['text_style'])
          ],
        ),
      ),
    ),
  );
}

Widget headerSection(String name) {
  return Container(
    margin: const EdgeInsets.only(top: 50.0),
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
    child: Center(
      child: Column(
        children: [
          const Text('COMPANY H2N',
            textAlign: TextAlign.center,
            style: TextStyle(
                height: 3.0,
                letterSpacing: 2.0,
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          ),
          Text(name,
              style: const TextStyle(color: Colors.white70, fontSize: 40.0,)
          ),
        ],
      ),
    ),
  );
}

buildSnackBar(String value) {
  return SnackBar(
    content: Text(value, style: const TextStyle(color: Colors.white)),
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.black,
    behavior: SnackBarBehavior.floating
  );
}

buildStatCard(value, name, cardColor, valueColor, nameColor){
  return Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: cardColor,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(NumberFormat.compact().format(value),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: valueColor))),
        Text(name.toUpperCase(), style: TextStyle(color: nameColor))
      ],
    ),
  );
}

Future<dynamic> createMap(String key) async {
  var map = <String, dynamic>{};
  var user = <String, dynamic>{};
  final _prefs = await PreferenceManager.getInstance();
  switch(key) {
    case "Register":
      map['login'] = await _prefs!.getItem("Email/Phone");
      map['password'] = await _prefs.getItem("Password");
      break;
    case "Login":
      map['login'] = await _prefs!.getItem("Email/Phone");
      map['password'] = await _prefs.getItem("Password");
      break;
    case "facebook_login":
      map['app'] = 'customer';
      map['access_token'] = await _prefs!.getItem("token");
      user["facebook"] = map;
      break;
  }
  return map;
}

convertTime(time){
  int hh;
  List<String> abc = time.split(':');
  hh = int.parse(abc[0]);
  if (hh > 12) {
    hh = hh - 12;
    return '$hh:${abc[1]} PM';
  } else{
    return '$hh:${abc[1]} AM';
  }
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