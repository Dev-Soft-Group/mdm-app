import 'package:mdmscoops/models/response_model/publication_model.dart';

abstract class PublicationService {
  Future<void> getAllPublications({
    Function(PublicationResponseModel data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> searchAllPublications({
    dynamic data,
    Function(PublicationResponseModel data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> getAllPublicationsForEnterprise({
    String? idEntreprise,
    Function(PublicationResponseModel data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> addPublication({
    dynamic data,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });
}
