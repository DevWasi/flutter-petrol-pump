import 'dart:convert';
import 'package:h2n_app/request/request_handler.dart';
import 'package:http/http.dart' as http;
import 'package:h2n_app/utils/manager.dart';

import 'package:h2n_app/utils/constants.dart';

getDataByRole(path) async {
  final RequestHandler _client = RequestHandler();
  final _prefs = await PreferenceManager.getInstance();
  var role = await _prefs!.getItem("role");
  List data = [];
  print("====================role=================");
  print(role);
  print("====================role=================");
  switch (role) {
    case "admin":
      data = await _client.authGet(path);
      break;
  }

  return data;
}
