import 'dart:convert';
import 'package:h2n_app/utils/manager.dart';
import 'package:http/http.dart' as http;

import 'package:h2n_app/utils/manager.dart';
import 'package:h2n_app/utils/constants.dart';
import 'package:h2n_app/utils/common.dart';

class RequestHandler {
  get baseURl => baseURL;


  Future<dynamic> post (String path, {dynamic body, bool flag = false}) async {
    final _prefs = await PreferenceManager.getInstance();
    if (flag) {
      final map = await createMap("facebook_login");
      http.post(baseURl + path,
          headers: requestHeaders,
          body: jsonEncode(map)
      );
    } else {
      final res = http.post(baseURl+path, headers: getHeaders(), body: jsonEncode(body));

      return res.then((value) {
        print("====================value====================");
        print(value);
        print("====================value====================");

        return value.statusCode.toString();
      });
    }
  }
  
  Future<dynamic> update (String path, {dynamic body}) async {
    dynamic data;
    await http.put(baseURl +'/'+path, headers: getHeaders(), body: jsonEncode(body)).then((value) {
      data = jsonDecode(value.body);
    });
    
    return data;
  }

  Future<dynamic> by (String path, dynamic query, {bool sync = false}) async {
    if(sync) {
      dynamic data = await http.post(baseURl+'/'+path+'/by',
          headers: requestHeaders,
          body: jsonEncode(query));
      data = jsonDecode(data.body);

      return data[path];
    } else {
      return http.post(baseURl+'/'+path+'/by',
          headers: requestHeaders,
          body: jsonEncode(query)).then((value) {
        final data = jsonDecode(value.body);

        return data[path];
      });
    }
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

