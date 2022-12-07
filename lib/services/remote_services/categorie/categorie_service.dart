
import 'package:mdmscoops/models/response_model/categorie_paginate_model.dart';

abstract class CategorieService {
  Future<void> getAllCategories({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> getCategories({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> getAllProductsCategories({
    dynamic url,
    Function(CategoriePaginateResponseModel data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> addCategories({
    dynamic data,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });
}