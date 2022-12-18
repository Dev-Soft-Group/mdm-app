
abstract class ServicesService {
  Future<void> getAllServices({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> addService({
    dynamic data,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });

  Future<void> updateService({
    dynamic data,
    String? idService,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  });
}