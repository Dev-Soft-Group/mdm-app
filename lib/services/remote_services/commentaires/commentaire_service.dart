import 'package:mdmscoops/models/response_model/commentaire_model.dart';

abstract class CommentairesService {
  Future<void> getAllCommentForPublication({
    String? idPublication,
    Function(CommentaireResponseModel data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> saveCommentForPublication({
    String? idPublication,
    dynamic data,
    Function(Commentaire data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> saveCommentForProduit({
    String? idProduit,
    dynamic data,
    Function(Commentaire data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> getAllCommentForProduit({
    String? idProduit,
    Function(CommentaireResponseModel data)? onSuccess,
    Function(dynamic error)? onError,
  });

}
