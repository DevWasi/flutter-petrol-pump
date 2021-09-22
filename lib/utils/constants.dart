import 'package:h2n_app/utils/manager.dart';


//REQUEST
const baseURL    =   'https://dc81-72-255-34-241.ngrok.io/api/v1';

getHeaders() {
  dynamic headers =   {'Content-Type': 'application/json', 'Origin': '*'};
  return headers;
}

getAuthHeaders() {
  PreferenceManager _pref = PreferenceManager();
  String token = _pref.getItem('token').toString();
  dynamic headers =   {'Content-Type': 'application/json; charset=UTF-8', 'Authorization': "Bearer"+token};

  return headers;
}


//ROUTEs
const screenHome            =   '/home';
const screenLearnQuran      =   '/learn';
const screenUsersStatuses   =   '/users';
const screenRegister        =   '/register';
const screenLogin           =   '/login';
const screenPrayerTimings   =   '/timings';
const screenSettings        =   '/settings';
const screenUserActivity    =   '/user_activity';
const screenAbout           =   '/about';
const screenWrapper         =   '/wrapper';
const screenQibla           =   '/qibla';
