
abstract class SecteurActiviteService {
  Future<void> getAllSecteurActivite({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> addSecteurActivite({
    dynamic data,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });
}