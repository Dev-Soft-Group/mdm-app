import 'package:mdmscoops/models/response_model/produit_model.dart';
import 'package:mdmscoops/models/response_model/produit_paginate_model.dart';

abstract class ProduitService {
  Future<void> getAllProduits({
    Function(ProduitResponseModel data)? onSuccess,
    Function(dynamic error)? onError,
  });

   Future<void> getPaginateProduits({
    dynamic next,
    String? categoryId,
    String? page,
    Function(ProduitPaginateResponseModel data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> getProduitById({
    String? productId,
    Function(Produit data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> addProduit({
    dynamic data,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });
}
