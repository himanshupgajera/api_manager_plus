import 'dart:convert';
import 'package:http/http.dart' as http;

/// A utility class for handling HTTP responses in a consistent manner.
///
/// Parses the response, checks the status code, and throws descriptive
/// exceptions on error.
///
/// ## Example:
/// ```dart
/// final response = await http.get(Uri.parse(url));
/// final result = ApiResponseHandler.handle(response);
/// print(result);
/// ```
class ApiResponseHandler {
  /// Handles the HTTP [response] and returns a parsed body on success.
  ///
  /// If the response code is:
  /// - `200–299`: Returns the decoded JSON body.
  /// - `400`: Throws the message from the response body or "Bad Request".
  /// - `401`: Throws "Unauthorized".
  /// - `403`: Throws "Forbidden".
  /// - `404`: Throws "Not Found".
  /// - `500+`: Throws "Server Error: Try again later".
  /// - Other: Throws "Unexpected error: [statusCode]".
  ///
  /// Throws a [String] error message on failure.
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
