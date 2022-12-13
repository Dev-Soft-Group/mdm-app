
import 'package:dio/dio.dart';
import 'package:mdmscoops/models/response_model/entreprise_model.dart';
import 'package:mdmscoops/models/response_model/secteur_activite_model.dart';

abstract class SecteurActiviteService {
  Future<void> getAllSecteurActivite({
    Function(SecteurActiviteResponseModel data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> addSecteurActivite({
    dynamic data,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });

   Future<void> getEntreprisesForSector({
    String? idSecteur,
    Function(EntrepriseResponseModel data)? onSuccess,
    Function(DioError error)? onError,
  });
}