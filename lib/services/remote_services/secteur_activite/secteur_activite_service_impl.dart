// ignore_for_file: unnecessary_null_comparison

import 'package:dio/dio.dart';
import 'package:mdmscoops/core/app_constantes.dart';
import 'package:mdmscoops/core/app_library.dart';
import 'package:mdmscoops/models/response_model/corps_metier_model.dart';
import 'package:mdmscoops/models/response_model/entreprise_model.dart';
import 'package:mdmscoops/models/response_model/secteur_activite_model.dart';
import 'package:mdmscoops/services/local_services/authentification/authentification.dart';
import 'package:mdmscoops/services/remote_services/secteur_activite/secteur_activite.dart';

class SecteurActiviteServiceImpl implements SecteurActiviteService {
  final LocalAuthService _localAuth = LocalAuthServiceImpl();

  @override
  Future<void> getAllSecteurActivite(
      {Function(SecteurActiviteResponseModel data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/secteur-activite/",
      token: await _localAuth.getToken(),
    ).get(onSuccess: (data) {
      onSuccess!(SecteurActiviteResponseModel.fromMap(data));
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }

  @override
  Future<void> searchAllSecteurActivite(
      {dynamic data,
      Function(SecteurActiviteResponseModel data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/secteur-activite/search",
      data: data!,
      token: await _localAuth.getToken(),
    ).post(onSuccess: (data) {
      onSuccess!(SecteurActiviteResponseModel.fromMap(data));
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }

  @override
  Future<void> searchAllCoprsForSecteurActivite(
      {dynamic data,
      Function(CoprsMetierResponseModel data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/corps-metier/search",
      data: data!,
      token: await _localAuth.getToken(),
    ).post(onSuccess: (data) {
      onSuccess!(CoprsMetierResponseModel.fromMap(data));
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }

  @override
  Future<void> addSecteurActivite(
      {dynamic data,
      Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/secteur-activite/",
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
  Future<void> updateSecteurActivite(
      {dynamic data,
      String? idSecteur,
      Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/secteur-activite/$idSecteur/",
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

  @override
  Future<void> getCorpsMetierForSector(
      {String? idSecteur,
      Function(CoprsMetierResponseModel data)? onSuccess,
      Function(DioError error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/secteur-activite/$idSecteur/corps-metier/",
      token: await _localAuth.getToken(),
    ).get(onSuccess: (data) {
      onSuccess!(CoprsMetierResponseModel.fromMap(data));
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }

  @override
  Future<void> getEntreprisesForCorpsMetier(
      {String? idCorpsMetier,
      Function(EntrepriseResponseModel data)? onSuccess,
      Function(DioError error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/corps-metier/$idCorpsMetier/entreprises/",
      token: await _localAuth.getToken(),
    ).get(onSuccess: (data) {
      onSuccess!(EntrepriseResponseModel.fromMap(data));
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }
}
