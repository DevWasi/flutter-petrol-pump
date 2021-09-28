import 'package:flutter/material.dart';
import 'package:h2n_app/utils/common.dart';
import 'package:h2n_app/utils/constants.dart';

import 'package:h2n_app/utils/manager.dart';
import 'package:h2n_app/screens/auth/auth_screen.dart';

import 'app_button.dart';

getActions(entity) {
  List? actions;
  switch (entity) {
    case "Login":
      actions = [
        {
          "name": "Login",
          "type": ButtonType.PRIMARY,
        }
      ];
      break;
      case "Register":
      actions = [
        {
          "name": "Register",
          "type": ButtonType.PRIMARY,
        }
      ];
      break;
  }

  return actions;
}

getModel(entity) {
  List? model;
  switch (entity) {
    case 'Login':
      model = [
        {
          "attribute": "email",
          "label": "Email/Phone",
          "type": "text",
          "initial_value": "wasibiit@gmail.com",
          "cursor_color": Colors.black,
          "icon": Icons.email,
          "icon_color": Constants.primaryTextColor,
          "text_color": const TextStyle(color: Constants.primaryTextColor),
          "border": const OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
        },
        {
          "attribute": "password",
          "label": "Password",
          "type": "password",
          "cursor_color": Colors.black,
          "icon": Icons.lock,
          "icon_color": Constants.primaryTextColor,
          "text_color": const TextStyle(color: Constants.primaryTextColor),
          "initial_value": "123",
          "border": const OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
        }
      ];
      break;
      case 'Register':
      model = [
        {
          "attribute": "email",
          "label": "Email/Phone",
          "type": "text",
          "cursor_color": Colors.black,
          "icon": Icons.email,
          "icon_color": Constants.primaryTextColor,
          "text_color": const TextStyle(color: Constants.primaryTextColor),
          "border": const OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
        },
        {
          "attribute": "password",
          "label": "Password",
          "type": "password",
          "cursor_color": Colors.black,
          "icon": Icons.lock,
          "icon_color": Constants.primaryTextColor,
          "text_color": const TextStyle(color: Constants.primaryTextColor),
          "border": const OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
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
      case 'password':
        fields.add(passwordField(attribute));
        break;
      default:
        fields.add(textField(attribute));
        break;
    }
    fields.add(const SizedBox(height: 30.0));
  }
  for (var action in actions) {
    fields.add(formButton(action, entity, formkey, context, scaffoldKey));
  }
  return fields;
}

passwordField(attribute) {
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
        icon: Icon(
            attribute['icon'],
            color: attribute["icon_color"]
        ),
        border: attribute['border'],
        labelStyle: attribute['text_color'],
        labelText: attribute['label']),
  );
}

textField(attribute) {
  return TextFormField(
    textInputAction: attribute['input_action'],
    validator: (value) {
      String? text;
      if (value!.isNotEmpty) {
        text = validateString(attribute['label'], value);
      } else if (value.isEmpty) {
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
        icon: Icon(
            attribute['icon'],
            color: attribute["icon_color"]
        ),
        border: attribute['border'],
        labelStyle: attribute['text_color'],
        labelText: attribute['label']),
  );
}

formButton(action, entity, formkey, context, scaffoldKey) {
  AuthScreenState _instance = AuthScreenState();
  return Container(
    alignment: action['alignment'],
    child: AppButton(
        onPressed: () { _instance.submitForm(entity, formkey, context, scaffoldKey);},
        text: action['name'],
        size: 300.0,
        type: action['type']
    ),
  );
}

String? validateString(String key, String value) {
  if (value.isEmpty) {
    return key + ' Is Required';
  } else if (key == 'Email/Phone' &&
      !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(value)) {
    return 'Please Enter A Valid Email';
  } else if (key == 'Password' && value.length < 3) {
    return 'Password must be 6 digit long';
  } else {}
}
