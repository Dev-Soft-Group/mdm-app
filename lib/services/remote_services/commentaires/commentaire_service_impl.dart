// ignore_for_file: unnecessary_null_comparison

import 'package:mdmscoops/core/app_constantes.dart';
import 'package:mdmscoops/core/app_library.dart';
import 'package:mdmscoops/models/response_model/commentaire_model.dart';
import 'package:mdmscoops/services/local_services/authentification/authentification.dart';
import 'package:mdmscoops/services/remote_services/commentaires/commentaire_service.dart';

class CommentairesServiceImpl implements CommentairesService {
  final LocalAuthService _localAuth = LocalAuthServiceImpl();

  @override
  Future<void> getAllCommentForPublication(
      {String? idPublication,
      Function(CommentaireResponseModel data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/commentaires/$idPublication/publication",
      token: await _localAuth.getToken(),
    ).get(onSuccess: (data) {
      onSuccess!(CommentaireResponseModel.fromMap(data));
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }

   @override
  Future<void> saveCommentForPublication(
      {String? idPublication,
      dynamic data,
      Function(Commentaire data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/commentaires/$idPublication/publication",
      data: data!,
      token: await _localAuth.getToken(),
    ).post(onSuccess: (data) {
      onSuccess!(Commentaire.fromMap(data));
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }

   @override
  Future<void> saveCommentForProduit(
      {String? idProduit,
      dynamic data,
      Function(Commentaire data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/commentaires/$idProduit/produit",
      data: data!,
      token: await _localAuth.getToken(),
    ).post(onSuccess: (data) {
      onSuccess!(Commentaire.fromMap(data));
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }


  @override
  Future<void> getAllCommentForProduit(
      {String? idProduit,
      Function(CommentaireResponseModel data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/commentaires/$idProduit/produit",
      token: await _localAuth.getToken(),
    ).get(onSuccess: (data) {
      onSuccess!(CommentaireResponseModel.fromMap(data));
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }
}
