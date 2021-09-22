import 'package:flutter/material.dart';

import 'package:h2n_app/utils/manager.dart';
import 'package:h2n_app/utils/constants.dart';
import 'package:h2n_app/screens/drawer/model.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  String name = '';
  String email = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
  }

  getProfile() async {
    final _prefs = await PreferenceManager.getInstance();
        setState(() {
          name = _prefs!.getItem('first_name') +' '+ _prefs.getItem('last_name');
          email = _prefs.getItem('email');
        });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[600],
      padding: const EdgeInsets.only(top: 50.0, bottom: 70.0, left: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                child: const Icon(Icons.person), backgroundColor: Colors.grey[800],
                radius: 30.0,
              ),
              const SizedBox(width: 10.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getText(name, Colors.white, FontWeight.bold, 19.0),
                  const SizedBox(height: 5.0,),
                  getText(email, Colors.white, FontWeight.bold, 19.0)
                ],
              )
            ],
          ),
          Column(
            children: getDrawerItems(context),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.popAndPushNamed(context, screenSettings);
                },
                child: const Icon(Icons.settings, color: Colors.white),
              ),
              const SizedBox(width: 10.0,),
              const Text('Settings',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(width: 10.0,),
              Container(width: 2.0, height: 20.0, color: Colors.white,),
              const SizedBox(width: 10.0,),
              InkWell(
                  onTap: () async {
                    final _prefs = await PreferenceManager.getInstance();
                    _prefs!.removeItem('status');
                    Navigator.popAndPushNamed(context, screenLogin);
                  },
                  child: const Text('Log Out',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getText (name, color, fontWeight, fontSize) {
    return Text(name, style: TextStyle(
    color: color, fontWeight: fontWeight, fontSize: fontSize
    )
  );
  }
}
