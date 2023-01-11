import 'package:mdmscoops/models/response_model/categorie_paginate_model.dart';

abstract class CategorieService {
  Future<void> getAllCategories({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });


  Future<void> getAllCategoriesServices({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> getAllProductsCategories({
    dynamic url,
    String? pageSize,
    Function(CategoriePaginateResponseModel data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> searchAllProductsCategories({
    dynamic url,
    String? pageSize,
    dynamic data,
    Function(CategoriePaginateResponseModel data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> addCategories({
    dynamic data,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });
}
