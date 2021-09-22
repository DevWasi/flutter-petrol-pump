import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:h2n_app/utils/constants.dart';

List<Map> drawerItems = [
  {
    'icon': FontAwesomeIcons.flag, 'title': 'My Activity',
    'route': screenUserActivity
  },
  {
    'icon': FontAwesomeIcons.user, 'title': 'Users Statuses',
    'route': screenUsersStatuses
  },
  {
    'icon': FontAwesomeIcons.mosque, 'title': 'Prayers',
    'route': screenPrayerTimings
  },
  {
    'icon': FontAwesomeIcons.bookOpen,
    'title': 'Learn Quran',
    'route': screenLearnQuran
  },
  {
    'icon': Icons.help_outline,
    'title': 'About',
    'route': screenAbout
  }
];


getDrawerItems(context) {
  return drawerItems.map((element) => GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, element['route']);
    },
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(element['icon'], color: Colors.white, size: 30.0,),
          const SizedBox(width: 20.0,),
          Text(
              element['title'],
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
              )
          )
        ],
      ),
    ),
  )).toList();
}