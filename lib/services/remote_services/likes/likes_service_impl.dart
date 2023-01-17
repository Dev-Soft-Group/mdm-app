// ignore_for_file: unnecessary_null_comparison

import 'package:mdmscoops/core/app_constantes.dart';
import 'package:mdmscoops/core/app_library.dart';
import 'package:mdmscoops/models/response_model/commentaire_model.dart';
import 'package:mdmscoops/services/local_services/authentification/authentification.dart';
import 'package:mdmscoops/services/remote_services/likes/likes.dart';

class LikesServiceImpl implements LikesService {
  final LocalAuthService _localAuth = LocalAuthServiceImpl();

   @override
  Future<void> likerPublication(
      {String? idPublication,
      dynamic data,
      Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/likes/$idPublication/publication",
      data: {},
      token: await _localAuth.getToken(),
    ).post(onSuccess: (data) {
      onSuccess!(data);
    }, onError: (error) {
      if (error != null) {
        onError!(error);
      }
    });
  }

   @override
  Future<void> likerProduit(
      {String? idProduit,
      Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRequest(
      url: "${Constantes.API_URL}/likes/$idProduit/produit",
      data: {},
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
