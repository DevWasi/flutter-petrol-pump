import 'package:h2n_app/utils/manager.dart';


//REQUEST
const baseURL    =   'https://5111-72-255-34-241.ngrok.io/v1';
const requestHeaders =   {'Content-Type': 'application/json; charset=UTF-8'};

getHeaders() {
  PreferenceManager _pref = PreferenceManager();
  String token = _pref.getItem('token').toString();
  dynamic headers =   {'Content-Type': 'application/json; charset=UTF-8', 'Authorization': "Bearer"+token};

  return headers;
}


//ROUTEs
const screenHome            =   '/home';
const screenLearnQuran      =   '/learn';
const screenUsersStatuses   =   '/users';
const screenSignUp          =   '/register';
const screenSignIn          =   '/login';
const screenPrayerTimings   =   '/timings';
const screenSettings        =   '/settings';
const screenUserActivity    =   '/user_activity';
const screenAbout           =   '/about';
const screenWrapper         =   '/wrapper';
const screenQibla           =   '/qibla';
