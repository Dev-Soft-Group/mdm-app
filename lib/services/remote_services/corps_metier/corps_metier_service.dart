
abstract class CorpsMetierService {
  Future<void> getAllCorpsMetier({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> addCorpsMetier({
    dynamic data,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });
}