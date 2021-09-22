import 'package:flutter/material.dart';

import 'package:h2n_app/screens/home/home_screen.dart';
import 'package:h2n_app/screens/drawer/drawer_screen.dart';
// import 'package:LearnQuran/screens/dashboard/users_statuses_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          DrawerScreen(),
          HomePage(),
        ],
      ),
    );
  }
}
