
import 'package:mdmscoops/core/app_constantes.dart';
import 'package:mdmscoops/services/local_services/authentification/authentification.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalAuthServiceImpl implements LocalAuthService {
  @override
  Future<bool> deleteToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.clear();
  }

  @override
  Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(Constantes.ACCESSTOKEN);
  }

  @override
  Future<bool> hasAuthenticate() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString(Constantes.ACCESSTOKEN) != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> saveToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(Constantes.ACCESSTOKEN, token);
    return true;
  }


  @override
  Future<bool> saveUser(String user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(Constantes.USERDATA, user);
    return true;
  }

  @override
  Future<String?> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(Constantes.USERDATA);
  }
}
