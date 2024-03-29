import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final  _instancia = UserPreferences._internal();

  factory UserPreferences() {
    return _instancia;
  }
    UserPreferences._internal();

  late SharedPreferences _prefs;

  Future<void> initPrefs() async {
     _prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del nombre
  String get token {
    return _prefs.getString('token') ?? '';
  }

  set token( String value ) {
    _prefs.setString('token', value);
  }
  

  // GET y SET de la última página
  String get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'login';
  }

  set ultimaPagina( String value ) {
    _prefs.setString('ultimaPagina', value);
  }
}
