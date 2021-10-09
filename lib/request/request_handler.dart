import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:h2n_app/utils/manager.dart';

import 'package:h2n_app/utils/constants.dart';

class RequestHandler {
  get baseURl => baseURL;


  Future<dynamic> post (String path, {dynamic body}) async {
    final _prefs = await PreferenceManager.getInstance();
    var url = Uri.parse( baseURl+path);
    final res = http.post(url, headers: getHeaders(), body: jsonEncode(body));

      return res.then((value) {
      final data = jsonDecode(value.body);
      if(data.containsKey('error')) {
        return data["error"]["message"];
      } else {
        _prefs!.setItem("jwt_token", data["token"]);
        _prefs.setItem("name", data["name"]);
        _prefs.setItem("role", data["role"]);
        _prefs.setItem("email", data["email"]);
        return value.statusCode.toString();
      }});
    }
  Future<dynamic> authPost (String path, {dynamic body}) async {
    final _prefs = await PreferenceManager.getInstance();
    var url = Uri.parse( baseURl+path);
    final res = http.post(url, headers: getAuthHeaders(), body: jsonEncode(body));

      return res.then((value) {
      final data = jsonDecode(value.body);
      if(data.containsKey('error')) {
        return data["error"]["message"];
      } else {
        _prefs!.setItem("jwt_token", data["token"]);
        _prefs.setItem("name", data["name"]);
        _prefs.setItem("role", data["role"]);
        _prefs.setItem("email", data["email"]);
        return value.statusCode.toString();
      }});
    }
  Future<dynamic> get (String path) async {
    final _prefs = await PreferenceManager.getInstance();
    var url = Uri.parse( baseURl+path);
    final res = http.get(url, headers: getHeaders());
      return res.then((value) {
      final data = jsonDecode(value.body);
      if(data.containsKey('error')) {
        return data["error"]["message"];
      } else {
        return data["data"];
      }});
    }
  Future<dynamic> authGet (String path) async {
    final _prefs = await PreferenceManager.getInstance();
    var url = Uri.parse( baseURl+path);
    final res = http.get(url, headers: getAuthHeaders());
      return res.then((value) {
      final data = jsonDecode(value.body);
      if(data.containsKey('error')) {
        return data["error"]["message"];
      } else {
        return data["data"];
      }});
    }

  // Future<bool> getProfile() async {
  //   final _prefs = await PreferenceManager.getInstance();
  //   final graphResponse = await http.get(
  //       'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${_prefs.getItem("token")}');
  //   var profile = jsonDecode(graphResponse.body);
  //
  //   return profile;
  // }

  // Future<dynamic> getFCMToken() async {
  //   String token;
  //   await _fcm.getToken().then((fcmToken) {
  //     token = fcmToken.toString();
  //   });
  //
  //   return token;
  // }

  // configureListeners() {
  //   _fcm.configure(
  //       onMessage: (Map<String, dynamic> message) async {
  //         print("-----------On Message-----------------");
  //         print(message);
  //         print("----------------------------");
  //       }, onLaunch: (Map<String, dynamic> message) async {
  //     print("-----------On Launch-----------------");
  //     print(message);
  //     print("----------------------------");
  //   }, onResume: (Map<String, dynamic> message) async {
  //     print("-----------On Resume-----------------");
  //     print(message);
  //     print("----------------------------");
  //   });
  // }

  // notificationPermissions() {
  //   _fcm.requestNotificationPermissions(
  //     IosNotificationSettings(
  //       sound: true,
  //       badge: true,
  //       alert: true,
  //     ),
  //   );
  // }
}

