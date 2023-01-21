
import 'package:mdmscoops/models/response_model/entreprise_model.dart';

abstract class ServicesService {
  Future<void> getAllServices({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> getAllServicesNotForMy({
    String? idEntreprise,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> getAllEntrepriseForService({
    String? idService,
    Function(EntrepriseResponseModel data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> addService({
    dynamic data,
    String? idEntreprise,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> updateService({
    dynamic data,
    String? idService,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });
}