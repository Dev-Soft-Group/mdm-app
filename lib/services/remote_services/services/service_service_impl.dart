// ignore_for_file: unnecessary_null_comparison

import 'package:mdmscoops/core/app_constantes.dart';
import 'package:mdmscoops/core/app_library.dart';
import 'package:mdmscoops/models/response_model/entreprise_model.dart';
import 'package:mdmscoops/models/response_model/services_models.dart';
import 'package:mdmscoops/services/local_services/authentification/authentification.dart';
import 'package:mdmscoops/services/remote_services/services/service_service.dart';

class ServicesServiceImpl implements ServicesService {
  final LocalAuthService _localAuth = LocalAuthServiceImpl();

  @override
  Future<void> getAllServices(
      {Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/service/",
      token: await _localAuth.getToken(),
    ).get(onSuccess: (data) {
      onSuccess!(SeviceResponseModel.fromMap(data));
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }

   @override
  Future<void> getAllEntrepriseForService(
      {String? idService,
    Function(EntrepriseResponseModel data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/service/$idService/entreprises",
      token: await _localAuth.getToken(),
    ).get(onSuccess: (data) {
      onSuccess!(EntrepriseResponseModel.fromMap(data));
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }

 @override
  Future<void> addService(
      {dynamic data,
      Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/service/",
      data: data!,
      token: await _localAuth.getToken(),
    ).post(onSuccess: (data) {
      onSuccess!(data);
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }

  @override
  Future<void> updateService(
      {dynamic data,
      String? idService,
      Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/service/$idService/",
      data: data!,
      token: await _localAuth.getToken(),
    ).put(onSuccess: (data) {
      onSuccess!(data);
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }
}
