import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:h2n_app/screens/auth/auth_screen.dart';
import 'package:h2n_app/utils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Home",
        debugShowCheckedModeBanner: false,
        theme: _buildDarkTheme(),
        home: const AuthScreen(name: 'login'),
        routes: routes()
    );
  }
}

ThemeData _buildDarkTheme() {
  final baseTheme = ThemeData(
    fontFamily: "Open Sans",
  );
  return baseTheme.copyWith(
      brightness: Brightness.dark,
      primaryColor: Colors.grey[900],
      primaryColorLight: Colors.grey[200],
      primaryColorDark: Colors.grey[900],
      primaryColorBrightness: Brightness.dark,
      errorColor: Colors.greenAccent,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white)
  );
}
