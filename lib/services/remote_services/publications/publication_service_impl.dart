// ignore_for_file: unnecessary_null_comparison

import 'package:mdmscoops/core/app_constantes.dart';
import 'package:mdmscoops/core/app_library.dart';
import 'package:mdmscoops/models/response_model/publication_model.dart';
import 'package:mdmscoops/services/local_services/authentification/authentification.dart';
import 'package:mdmscoops/services/remote_services/publications/publication_service.dart';

class PublicationServiceImpl implements PublicationService {
  final LocalAuthService _localAuth = LocalAuthServiceImpl();

  @override
  Future<void> getAllPublications(
      {Function(PublicationResponseModel data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/publication/",
      token: await _localAuth.getToken(),
    ).get(onSuccess: (data) {
      onSuccess!(PublicationResponseModel.fromMap(data));
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }

  @override
  Future<void> getAllPublicationsByType(
      {dynamic data,
      Function(PublicationResponseModel data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/publication/type",
      data: data!,
      token: await _localAuth.getToken(),
    ).post(onSuccess: (data) {
      onSuccess!(PublicationResponseModel.fromMap(data));
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }

  @override
  Future<void> getPublicationById(
      {String? idPublication,
      Function(Publication data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/publication/$idPublication/",
      token: await _localAuth.getToken(),
    ).get(onSuccess: (data) {
      onSuccess!(Publication.fromMap(data["results"]));
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }

  @override
  Future<void> searchAllPublications(
      {dynamic data,
      Function(PublicationResponseModel data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/publication/search",
      data: data!,
      token: await _localAuth.getToken(),
    ).post(onSuccess: (data) {
      onSuccess!(PublicationResponseModel.fromMap(data));
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }

  @override
  Future<void> getAllPublicationsForEnterprise(
      {String? idEntreprise,
      Function(PublicationResponseModel data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/entreprise/$idEntreprise/publications",
      token: await _localAuth.getToken(),
    ).get(onSuccess: (data) {
      onSuccess!(PublicationResponseModel.fromMap(data));
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }

  @override
  Future<void> addPublication(
      {dynamic data,
      Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/publication/",
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
  Future<void> updatePublication(
      {dynamic data,
      String? idPublication,
      Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/publication/$idPublication/",
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
