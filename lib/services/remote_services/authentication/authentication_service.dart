

import 'package:mdmscoops/models/request_model/login_model.dart';
import 'package:mdmscoops/models/request_model/register_model.dart';


abstract class RemoteAuthService {
  Future<void> login({
    LoginRequestModel? loginReqModel,
    Function(dynamic data)? onLoginSuccess,
    Function(dynamic error)? onLoginError,
  });

  Future<void> register({
    RegisterRequestModel? registerReqModel,
    Function(dynamic data)? onRegisterSuccess,
    Function(dynamic error)? onRegisterError,
  });
}