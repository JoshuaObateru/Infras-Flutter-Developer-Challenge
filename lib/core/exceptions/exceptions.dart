class CacheException implements Exception {
  final message;

  CacheException({this.message});

  String toString() {
    if (message == null) return "Exception";
    return "$message";
  }
}

class NetworkException implements Exception {
  final message;

  NetworkException({this.message});

  String toString() {
    if (message == null) return "Exception";
    return "Exception: $message";
  }
}

class MovieException implements Exception {
  final message;

  MovieException({this.message});

  String toString() {
    if (message == null) return "Exception";
    return "Exception: $message";
  }
}
