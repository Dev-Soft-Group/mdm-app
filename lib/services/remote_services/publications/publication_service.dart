
abstract class PublicationService {
  Future<void> getAllPublications({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> addPublication({
    dynamic data,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });
}