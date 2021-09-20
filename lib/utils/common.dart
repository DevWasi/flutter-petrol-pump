import 'package:h2n_app/request/request_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:h2n_app/utils/manager.dart';
import 'package:h2n_app/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

getCardModel() {
  List model;
  model = [
    {"name": "Users", "margin": const EdgeInsets.all(8.0), "splash_color": Colors.green,
      "axis_size": MainAxisSize.min, "Icon": const Icon(Icons.people, size: 70.0),
      "text_style": const TextStyle(fontSize: 17.0), "route": screenUsersStatuses
    },
    {"name": "Activity", "margin": const EdgeInsets.all(8.0), "splash_color": Colors.green,
      "axis_size": MainAxisSize.min, "Icon": const Icon(Icons.local_activity, size: 73.0),
      "text_style": const TextStyle(fontSize: 17.0), "route": screenUserActivity
    },
    {"name": "Prayers", "margin": const EdgeInsets.all(8.0), "splash_color": Colors.green,
      "axis_size": MainAxisSize.min, "Icon": const Icon(FontAwesomeIcons.mosque, size: 50.0),
      "text_style": const TextStyle(fontSize: 17.0), "route": screenPrayerTimings
    },
    {"name": "Learn Quran", "margin": const EdgeInsets.all(8.0), "splash_color": Colors.green,
      "axis_size": MainAxisSize.min, "Icon": const Icon(FontAwesomeIcons.bookOpen, size: 50.0),
      "text_style": const TextStyle(fontSize: 17.0), "route": screenLearnQuran
    },
    {"name": "Qibla", "margin": const EdgeInsets.all(8.0), "splash_color": Colors.green,
      "axis_size": MainAxisSize.min, "Icon": const Icon(FontAwesomeIcons.compass, size: 50.0),
      "text_style": const TextStyle(fontSize: 17.0), "route": screenQibla
    },
  ];

  return model;
}

getCardFields(context) {
  List model = getCardModel();
  List<Widget> fields = <Widget>[];
  for (var attribute in model) {
    switch (attribute['name']) {
      default: fields.add(getCards(attribute, context));
    }
  }

  return fields;
}

Widget appBar(String name, {dynamic leading}) {
  Widget appbar;
  if(name == 'dashboard') {
    appbar = AppBar(
      leading: leading,
      title: Text(
        name.toUpperCase(),
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20.0),
      ),
    );
  } else {
    appbar = AppBar(
      title: Text(
        name.toUpperCase(),
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

buidSnackBar(String value) {
  return SnackBar(
    content: Text(
        value.toUpperCase() +' FAILED',
        style: const TextStyle(color: Colors.white)
    ),
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.black,
  );
}

Future<dynamic> createMap(String key) async {
  var map = <String, dynamic>{};
  var user = <String, dynamic>{};
  RequestHandler _client = RequestHandler();
  final _prefs = await PreferenceManager.getInstance();
  map['device_type'] = 'android';
  // map['device_id'] = await _client.getFCMToken();
  switch(key) {
    case "signup":
      map['username'] = _prefs!.getItem("Email");
      map['password'] = _prefs.getItem("Password");
      user["customer"] = map;
      break;
    case "signin":
      map['username'] = _prefs!.getItem("Email");
      map['password'] = _prefs.getItem("Password");
      map['app'] = 'customer';
      user["session"] = map;
      break;
    case "facebook_login":
      map['app'] = 'customer';
      map['access_token'] = await _prefs!.getItem("token");
      user["facebook"] = map;
      break;
  }

  return user;
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