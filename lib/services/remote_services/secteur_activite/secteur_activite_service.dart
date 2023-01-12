import 'package:dio/dio.dart';
import 'package:mdmscoops/models/response_model/corps_metier_model.dart';
import 'package:mdmscoops/models/response_model/entreprise_model.dart';
import 'package:mdmscoops/models/response_model/secteur_activite_model.dart';

abstract class SecteurActiviteService {
  Future<void> getAllSecteurActivite({
    Function(SecteurActiviteResponseModel data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> searchAllSecteurActivite({
    dynamic data,
    Function(SecteurActiviteResponseModel data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> searchAllCoprsForSecteurActivite({
    dynamic data,
    Function(CoprsMetierResponseModel data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> addSecteurActivite({
    dynamic data,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> updateSecteurActivite({
    dynamic data,
    String? idSecteur,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> getCorpsMetierForSector({
    String? idSecteur,
    Function(CoprsMetierResponseModel data)? onSuccess,
    Function(DioError error)? onError,
  });

  Future<void> getEntreprisesForCorpsMetier(
      {String? idCorpsMetier,
      Function(EntrepriseResponseModel data) onSuccess,
      Function(DioError error) onError});
}
