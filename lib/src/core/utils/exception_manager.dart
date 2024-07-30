class ExceptionManager {
  const ExceptionManager._();

  Map<int, String> get mappedStatusCodes => _codesMap;

  static const _codesMap = {
    200: 'Successfully completed',
    400: 'Bad Request. Contact your administrator',
    401: 'Unauthorized response',
    404: 'Not Found',
    409: 'Duplicate values',
    405: 'Invalid Input / Validation',
    500: 'Internal Server Error',
  };

  static Exception getException(int? statusCode, [String? message]) {
    if (_codesMap.containsKey(statusCode)) {
      return Exception(_codesMap[statusCode]);
    } else {
      return UnknownException(
          message ?? "[$statusCode]: Unknown error. Please try again.");
    }
  }
}

class UnknownException implements Exception {
  final String message;
  UnknownException(this.message);

  @override
  String toString() => message;
}
