import 'package:flutter/material.dart';
import 'package:h2n_app/screens/auth/auth_screen.dart';

import 'package:h2n_app/utils/constants.dart';


routes () {
  dynamic routes = <String, WidgetBuilder>{
    // screenHome: (BuildContext context) => HomePage(),
    // screenUserActivity: (BuildContext context) => UserActivity(),
    // screenSettings: (BuildContext context) => SettingsPage(),
    // screenLearnQuran: (BuildContext context) => LearnQuran(),
    screenLogin: (BuildContext context) => const AuthScreen(name: 'login'),
    // screenUsersStatuses: (BuildContext context) => UsersStatuses(),
    // screenPrayerTimings: (BuildContext context) => PrayerTimings(),
    // screenWrapper: (BuildContext context) => Wrapper(),
    // screenQibla: (BuildContext context) => Qibla(),
  };

  return routes;
}