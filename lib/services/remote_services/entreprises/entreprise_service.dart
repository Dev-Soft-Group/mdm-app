
import 'package:dio/dio.dart';
import 'package:mdmscoops/models/response_model/entreprise_model.dart';

abstract class EntrepriseService {
  Future<void> getAllEntreprises({
    Function(EntrepriseResponseModel data)? onSuccess,
    Function(DioError error)? onError,
  });


  Future<void> getEntrepriseById({
    String? idEntreprise,
    Function(Entreprise data)? onSuccess,
    Function(DioError error)? onError,
  });

  Future<void> getAllEntreprisesForUser({
    Function(dynamic data)? onSuccess,
    Function(DioError error)? onError,
  });

  Future<void> getAllEntreprisesForMe({
    Function(EntrepriseResponseModel data)? onSuccess,
    Function(DioError error)? onError,
  });

  Future<void> addEntreprise({
    dynamic data,
    Function(dynamic data)? onSuccess,
    Function(DioError error)? onError,
  });
  
  Future<void> addSuccursale({
    dynamic data,
    Function(dynamic data)? onSuccess,
    Function(DioError error)? onError,
  });
}