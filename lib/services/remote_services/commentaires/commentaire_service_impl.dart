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
  Future<void> getAllCommentForProduct(
      {String? idProduct,
      Function(CommentaireResponseModel data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/commentaires/$idProduct/produit",
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
