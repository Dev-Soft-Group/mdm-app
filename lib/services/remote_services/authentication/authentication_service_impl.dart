



import 'package:mdmscoops/core/app_constantes.dart';
import 'package:mdmscoops/core/app_library.dart';
import 'package:mdmscoops/models/request_model/login_model.dart';
import 'package:mdmscoops/models/request_model/register_model.dart';
import 'package:mdmscoops/models/response_model/token_model.dart';
import 'package:mdmscoops/services/remote_services/authentication/authentication_service.dart';

class RemoteAuthServiceImpl implements RemoteAuthService {


  @override
  Future<void> login({
    LoginRequestModel? loginReqModel,
    Function(dynamic data)? onLoginSuccess,
    Function(dynamic error)? onLoginError}) async {
      ApiRequest(
        url: "${Constantes.API_URL}/jwt/create",
        data: loginReqModel!.toMap(),
      ).post(
        onSuccess: (data){
          onLoginSuccess!(TokenReponseModel.fromMap(data));
        },
        onError: (error){
          if (error != null) { onLoginError!(error);}
        }
      );
    
  }

  @override
  Future<void> register({
    RegisterRequestModel? registerReqModel,
    Function(dynamic data)? onRegisterSuccess,
    Function(dynamic error)? onRegisterError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/utilisateur/",
      data: registerReqModel!.toMap(),
    ).post(
       onSuccess: (data){
          onRegisterSuccess!(data);
        },
        onError: (error){
          if (error != null) { onRegisterError!(error);}
        }
    );
  } 

}