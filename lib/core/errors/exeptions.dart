abstract class AppException implements Exception {
  final String message;
  AppException(this.message);
}

class DatabaseException extends AppException {
  DatabaseException(String message) : super(message);
}

class CacheException extends AppException {
  CacheException(String message) : super(message);
}

class ValidationException extends AppException {
  ValidationException(String message) : super(message);
}

class LicenseException extends AppException {
  LicenseException(String message) : super(message);
}

class NotFoundException extends AppException {
  NotFoundException(String message) : super(message);
}