class ServerException implements Exception {

  final String message;

  ServerException({required this.message});
  String toString() {
    String message = this.message;
    if (message == null) return "Ошибка";
    return "$message";
  }
}

class NetworkException implements Exception {

  final String message;

  NetworkException({required this.message});

  String toString() {
    String message = this.message;
    if (message == null) return "Ошибка";
    return "$message";
  }
}