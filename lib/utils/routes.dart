import 'package:flutter/material.dart';
import 'package:h2n_app/screens/auth/auth_screen.dart';
import 'package:h2n_app/screens/home/home_screen.dart';
import 'package:h2n_app/screens/home/welcome.dart';
import 'package:h2n_app/screens/home/wrapper.dart';

import 'package:h2n_app/utils/constants.dart';


routes () {
  dynamic routes = <String, WidgetBuilder>{
    screenWelcome: (BuildContext context) => const Welcome(),
    screenHome: (BuildContext context) => const HomePage(name: '',),
    // screenUserActivity: (BuildContext context) => UserActivity(),
    // screenSettings: (BuildContext context) => SettingsPage(),
    // screenLearnQuran: (BuildContext context) => LearnQuran(),
    screenLogin: (BuildContext context) => const AuthScreen(name: "Login"),
    // screenUsersStatuses: (BuildContext context) => UsersStatuses(),
    // screenPrayerTimings: (BuildContext context) => PrayerTimings(),
    screenWrapper: (BuildContext context) => const Wrapper(),
    // screenQibla: (BuildContext context) => Qibla(),
  };

  return routes;
}