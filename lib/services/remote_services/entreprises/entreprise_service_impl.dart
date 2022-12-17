import 'package:dio/dio.dart';
import 'package:mdmscoops/core/app_constantes.dart';
import 'package:mdmscoops/core/app_library.dart';
import 'package:mdmscoops/models/response_model/entreprise_model.dart';
import 'package:mdmscoops/services/local_services/authentification/authentification.dart';
import 'package:mdmscoops/services/remote_services/entreprises/entreprise_service.dart';

class EntrepriseServiceImpl implements EntrepriseService {
  final LocalAuthService _localAuth = LocalAuthServiceImpl();

  @override
  Future<void> getAllEntreprises(
      {Function(EntrepriseResponseModel data)? onSuccess,
      Function(DioError error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/entreprise/",
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
  Future<void> getEntrepriseById(
      {String? idEntreprise,
      Function(Entreprise data)? onSuccess,
      Function(DioError error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/entreprise/$idEntreprise/",
      token: await _localAuth.getToken(),
    ).get(onSuccess: (data) {
      onSuccess!(Entreprise.fromMap(data["results"]));
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }

  @override
  Future<void> getAllEntreprisesForUser(
      {Function(dynamic data)? onSuccess,
      Function(DioError error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/entreprise/me",
      token: await _localAuth.getToken(),
    ).get(onSuccess: (data) {
      onSuccess!(data);
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }

  @override
  Future<void> getAllEntreprisesForMe(
      {Function(EntrepriseResponseModel data)? onSuccess,
      Function(DioError error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/entreprise/me",
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
  Future<void> addEntreprise(
      {dynamic data,
      Function(dynamic data)? onSuccess,
      Function(DioError error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/entreprise/",
      data: data,
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
  Future<void> addSuccursale(
      {dynamic data,
      Function(dynamic data)? onSuccess,
      Function(DioError error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/succursale/",
      data: data,
      token: await _localAuth.getToken(),
    ).post(onSuccess: (data) {
      onSuccess!(data);
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }
}
