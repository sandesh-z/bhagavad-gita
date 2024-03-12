class ServerException implements Exception {
  final String message;
  final int? statusCode;

  ServerException({
    this.statusCode,
    required this.message,
  });
}

class FatalException implements Exception {
  final String message;

  const FatalException({
    required this.message,
  });
}

class CacheException implements Exception {}
