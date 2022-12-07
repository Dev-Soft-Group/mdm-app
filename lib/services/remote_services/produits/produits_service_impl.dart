import 'package:mdmscoops/core/app_constantes.dart';
import 'package:mdmscoops/core/app_library.dart';
import 'package:mdmscoops/models/response_model/produit_model.dart';
import 'package:mdmscoops/models/response_model/produit_paginate_model.dart';
import 'package:mdmscoops/services/local_services/authentification/authentification.dart';
import 'package:mdmscoops/services/remote_services/produits/produits_service.dart';

class ProduitServiceImpl implements ProduitService {
  final LocalAuthService _localAuth = LocalAuthServiceImpl();

  @override
  Future<void> getAllProduits(
      {Function(ProduitResponseModel data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/produit/",
      token: await _localAuth.getToken(),
    ).get(onSuccess: (data) {
      onSuccess!(ProduitResponseModel.fromMap(data));
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }

  @override
  Future<void> getPaginateProduits(
      {dynamic next,
      String? categoryId,
      String? page,
      Function(ProduitPaginateResponseModel data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: next ?? "${Constantes.API_URL}/produit/pagine/$categoryId/prod_page=1",
      token: await _localAuth.getToken(),
    ).get(onSuccess: (data) {
      onSuccess!(ProduitPaginateResponseModel.fromMap(data));
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }

  @override
  Future<void> getProduitById(
      {String? productId,
      Function(Produit data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/produit/$productId/",
      token: await _localAuth.getToken(),
    ).get(onSuccess: (data) {
      onSuccess!(Produit.fromMap(data["results"]));
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }

  @override
  Future<void> addProduit(
      {dynamic data,
      Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/produit/",
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
