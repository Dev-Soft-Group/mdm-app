
import 'package:mdmscoops/models/response_model/corps_metier_model.dart';

abstract class CorpsMetierService {
  Future<void> getAllCorpsMetier({
    Function(CoprsMetierResponseModel data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> addCorpsMetier({
    dynamic data,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });
}