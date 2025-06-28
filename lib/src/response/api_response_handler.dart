import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiResponseHandler {
  static dynamic handle(http.Response response) {
    final statusCode = response.statusCode;
    final body = response.body.isNotEmpty ? json.decode(response.body) : {};

    if (statusCode >= 200 && statusCode < 300) {
      return body;
    } else if (statusCode == 400) {
      throw body['message'] ?? 'Bad Request';
    } else if (statusCode == 401) {
      throw 'Unauthorized';
    } else if (statusCode == 403) {
      throw 'Forbidden';
    } else if (statusCode == 404) {
      throw 'Not Found';
    } else if (statusCode >= 500) {
      throw 'Server Error: Try again later';
    } else {
      throw 'Unexpected error: $statusCode';
    }
  }
}
