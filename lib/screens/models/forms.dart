import 'package:flutter/material.dart';
import 'package:h2n_app/utils/common.dart';

import 'package:h2n_app/utils/manager.dart';
import 'package:h2n_app/screens/auth/auth_screen.dart';


getActions(entity) {
  List? actions;
  switch (entity) {
    case "login":
      actions = [
        {
          "name": "login",
          "type": "submit",
          "color": Colors.white70,
          "text_style": const TextStyle(fontSize: 15),
          "alignment": Alignment.center,
          "padding": const EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
          "shape": RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0))
        }
      ];
      break;
  }

  return actions;
}

getModel(entity) {
  List? model;
  switch (entity) {
    case 'login':
      model = [
        {"attribute": "email", "label": "Email", "type": "text",
        "cursor_color": Colors.white, "icon": Icons.email, "text_color": const TextStyle(color: Colors.white70),
          "initial_value": "wasibiit@gmail.com",
          "border": const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
          ),
        },
        {"attribute": "password", "label": "Password", "type": "password",
        "cursor_color": Colors.white, "icon": Icons.lock, "text_color": const TextStyle(color: Colors.white70),
          "initial_value": "123",
          "border": const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
        }
      ];
      break;
  }

  return model;
}

getFields(entity, formkey, context, scaffoldKey) {
  List model = getModel(entity);
  List actions = getActions(entity);
  List<Widget> fields = [];
  for (var attribute in model) {
    switch (attribute['type']) {
      case 'password': fields.add(passwordField(attribute));
        break;
      default: fields.add(textField(attribute));
      break;
    }
    fields.add(const SizedBox(height: 30.0));
  }
  for (var action in actions) {
    fields.add(formButton(action, entity, formkey, context, scaffoldKey));
  }
  return fields;
}

passwordField(attribute){
  return TextFormField(
    textInputAction: attribute['input_action'],
    validator: (value) {
      return validateString(attribute['label'], value!);
    },
    onSaved: (value) async {
      final _prefs = await PreferenceManager.getInstance();
      _prefs!.setItem(attribute['label'], value);
    },
    cursorColor: attribute['cursor_color'],
    obscureText: true,
    style: attribute['text_color'],
    initialValue: attribute['initial_value'],
    decoration: InputDecoration(
      icon: Icon(attribute['icon']),
      border: attribute['border'],
      labelStyle: attribute['text_color'],
      labelText: attribute['label']
    ),
  );
}

textField(attribute){
  return TextFormField(
    textInputAction: attribute['input_action'],
    validator: (value) {
      String? text;
      if(value!.isNotEmpty){
        text = validateString(attribute['label'], value)!;
      }else if(value.isEmpty) {
        text = capitalize(attribute['label']) + " is Required";
      }
      return text;
    },
    onSaved: (value) async {
      final _prefs = await PreferenceManager.getInstance();
      _prefs!.setItem(attribute['label'], value);
    },
    cursorColor: attribute['cursor_color'],
    style: attribute['text_color'],
    initialValue: attribute['initial_value'],
    decoration: InputDecoration(
      icon: Icon(attribute['icon']),
      border: attribute['border'],
      labelStyle: attribute['text_color'],
      labelText: attribute['label']
    ),
  );
}

formButton(action, entity, formkey, context, scaffoldKey) {
  AuthScreenState _instance = AuthScreenState();
  return Container(
    alignment: action['alignment'],
    child: ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith((states) => action["shape"]),
          padding: MaterialStateProperty.resolveWith((states) => action["padding"]),
          backgroundColor: MaterialStateProperty.resolveWith((states) => action["color"])
      ),
      child: Text(action['name'].toUpperCase(), style: action['text_style']),
      onPressed: () {
          _instance.submitForm(entity, formkey, context, scaffoldKey);
      }
    ),
  );
}

String? validateString(String key, String value) {
  if (value.isEmpty) {

    return key + ' Is Required';
  } else if (key == 'Email' &&
      !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(value)) {

    return 'Please Enter A Valid Email';
  } else if(key == 'Password' && value.length < 6) {

    return 'Password must be 6 digit long';
  } else {

    return null;
  }
}