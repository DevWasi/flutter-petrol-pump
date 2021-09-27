import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:h2n_app/utils/manager.dart';
import 'package:h2n_app/utils/common.dart';

class HomePage extends StatefulWidget {
  final String name;
  const HomePage({Key? key, required this.name}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = true;

  set name(name) {widget.name;}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMessage();
  }

  getMessage() async {
    final _prefs = await PreferenceManager.getInstance();
    setState(() {
      name = _prefs!.getItem('name');
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40.0 : 0.0),
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            xOffset = 0; yOffset = 0; scaleFactor = 1; isDrawerOpen = true;
          });
        },
        child: Scaffold(
          backgroundColor: Colors.grey[800],
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: appBar('dashboard', leading: IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  xOffset = 230; yOffset = 150; scaleFactor = 0.6; isDrawerOpen = false;
                });
              },
            ))
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30.0,),
                Text('Hi! $widget.name', style: const TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic, color: Colors.white),
                ),
                const SizedBox(height: 50.0),
                Container(
                  padding: const EdgeInsets.all(30.0),
                  child: GridView.count(
                    physics: const ScrollPhysics().parent,
                       shrinkWrap: true,
                      crossAxisCount: 2, children: getCardFields(context)
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
