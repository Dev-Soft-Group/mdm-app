import 'package:mdmscoops/core/app_constantes.dart';
import 'package:mdmscoops/core/app_library.dart';
import 'package:mdmscoops/models/response_model/categorie_paginate_model.dart';
import 'package:mdmscoops/services/local_services/authentification/authentification.dart';
import 'package:mdmscoops/services/remote_services/categorie/categorie.dart';

class CategorieServiceImpl implements CategorieService {
  final LocalAuthService _localAuth = LocalAuthServiceImpl();

  @override
  Future<void> getCategories(
      {Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/categorie/all",
      token: await _localAuth.getToken(),
    ).get(onSuccess: (data) {
      onSuccess!(data);
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }

  @override
  Future<void> getAllCategories(
      {Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/categories/all",
      token: await _localAuth.getToken(),
    ).get(onSuccess: (data) {
      onSuccess!(data);
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }

  
  @override
  Future<void> getAllProductsCategories(
      {dynamic url,
      String? pageSize,
      Function(CategoriePaginateResponseModel data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: url ?? "${Constantes.API_URL}/categories/",
      token: await _localAuth.getToken(),
    ).get(onSuccess: (data) {
      onSuccess!(CategoriePaginateResponseModel.fromMap(data));
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }

  @override
  Future<void> addCategories(
      {dynamic data,
      Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/categories/",
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
}
