

abstract class LikesService {
  
  Future<void> likerPublication({
    String? idPublication,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> likerProduit({
    String? idProduit,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });

}
