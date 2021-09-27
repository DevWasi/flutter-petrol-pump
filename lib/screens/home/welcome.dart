import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h2n_app/utils/constants.dart';
import 'package:h2n_app/utils/helper.dart';
import 'package:h2n_app/screens/models/app_button.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    "assets/images/welcome.png",
                    scale: 1.1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 24.0,
              ),
              decoration: const BoxDecoration(
                color: Constants.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  Text(
                    "Welcome to H2N!",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(19, 22, 33, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    "This is our app for Company to Track all inner and customer data.",
                    style: TextStyle(
                      color: Color.fromRGBO(74, 77, 84, 1),
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  // Let's create a generic button widget
                  AppButton(
                    text: "Log In",
                    type: ButtonType.PLAIN,
                    onPressed: () {
                      nextScreen(context, "/login");
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  AppButton(
                    text: "Create an Account",
                    type: ButtonType.PRIMARY, onPressed: () {  },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
