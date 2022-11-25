
import 'package:mdmscoops/models/response_model/categorie_model.dart';

abstract class CategorieService {
  Future<void> getAllCategories({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> getAllProductsCategories({
    Function(CategorieResponseModel data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> addCategories({
    dynamic data,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });
}